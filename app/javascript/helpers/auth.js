const CURRENT_USER_ID = 'data-current-user-id'

export const currentUserId = () => {
    return (
        document
            .querySelector(`[${CURRENT_USER_ID}]`)
            ?.getAttribute(CURRENT_USER_ID) || null
    )
}
