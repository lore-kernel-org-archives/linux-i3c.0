Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D71CFD313
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Nov 2025 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/JNVkQ3P2JiS45Dv17VAi3LqiFT/zj+jK/s09WIH1w=; b=UJK/OHmIeTxwqt
	vDSF8gvtxOI5ep9tSm8DicqT0zd6ypjKIRagpqBs1F6RASpfXHKgafGOY9QOTDkGQO9UU6pjfX+Eg
	YXjzE736DhAAJfSBgGuT2k/6pIyc3lvjB7YWJYrevcpn8ElBYP639HZmQED9bIOutq5lUCGQHbLpY
	x9QF0etpQ/gviBreBX/1nROztDhb/u73E8T34re+0OpOhK5fRt5jWTu+I5nlQ1Z5uytCytRjfGcOK
	ygppDz60aP5O2Fk74MpGjvgqfrTS30nmbaBtsgIkEzFLQLjzewwB7/Okv0b7sRKAjKQBlkE5TUK2R
	pJvROPhKN8R/019N3AZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNar6-0000000C8sv-1vUz;
	Mon, 24 Nov 2025 18:00:04 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNar4-0000000C8rH-2KN7
	for linux-i3c@lists.infradead.org;
	Mon, 24 Nov 2025 18:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofODp2PPC83jZfefl07IqwnECOkjmfyXspbxYWROZrGHRJbGd8RuFuuRPMHausmkG/y0AVDFggX6FCHg0gKuGlf7NOI/Z86x8F0/6elhHuVnljda4d63dR2Wg7ec7D+GZuU1ELUz0I6kMViF2rkRiL5ZbTQYh2omHzcq+AT/Htx91Ip8QfSzI+kFe7Y3dDsW3GQni2iBLrcQL/aJJzP+OqVEWH79ZdE/ztWN3e9wobSmeaPKxFLJKG4i/dgf/Z3CuCnowtxrl+abaRVZjsbaJR8fcK88vHIfTBLD+m+d8BEiLPotd9tLKfvRnuPtzIJamqowSXj/mx7fM6qSXBwanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zop2L3lykpD5rnNmeWa9lzQm+5LWXN16Po7zfh4kNKM=;
 b=Ehdj4QDS+OXToT8D8LFHxrwrsUKslqT3Ws9qYat8NiOSaJYLhJmmTP/gB++MyBvib1Z60F23i2FSZJkyXqy0xm6eQNoS8l5n2oSVCt/hDp/yDSEOI7vDfJ1CH5kyrH9jVtoqvIEdUdCVZMv9coxfeMusFq+jICtUMmS7/f+J9ybxxLOBNkWRLFsJo+/+qm6rmyg7F+UlXve0yPMX4byUFtJ4NFTX7ahXe24g27VJCFegV4NHtJ76CFPfYjQaDuo5efJEXgHenX57r5iFE54I+pn5MK+Vrp5CpZCiIZH6TivVL2R7Lh+MyuAyQEiZva9I3eD/xfFN+77ym0PG2mrBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zop2L3lykpD5rnNmeWa9lzQm+5LWXN16Po7zfh4kNKM=;
 b=nXowkyQyKfX9WJ2hsd51ojnkbt8QIUlPg1ooE3cLKw4aXofsd6YX0bs3mST6DGLZHJyO97EmHk6TVUBUTh6kmYr3vY6vyfWH6USpbXNPku70tGaN9d5714+FjZCEh5sczp/GixPJ3bzjbuNYd/vGJDWVqtJFdkAjzd6eHZLj0lRF4+wFrGjYRA+lA9w2f55Qrpe7dzlnYilZc6Op0LHe6oio/jMhnANYYcLfkbXwR7TnTRdTbbFPqxc46Nzh7ZFB7DRkFb5EmH/7nc+shRGwtiR6pZl9aUumg1CS8uPncZYZe/0NCfXojseOS5ZKeUAOiO/dYS6rIqwdE6r3NnFb6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB11930.eurprd04.prod.outlook.com (2603:10a6:20b:700::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 17:59:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:59:52 +0000
Date: Mon, 24 Nov 2025 12:59:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: dw: Add sysfs support for Device NACK Retry
 count
Message-ID: <aSSdEW4/WCpGxJ/o@lizhi-Precision-Tower-5810>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB11930:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b1c14b-d695-4076-b052-08de2b834497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYcEW+kWxbk0JvjAcOodgEaDyfOmnLDQMjrjjYC81rYQDDJZONhCbfltt1vO?=
 =?us-ascii?Q?Xpp8BM4Xx1oGJAXb+J89/M5W+ycz8ONU+k734zoOkm0pz7uECzc+0UrYn4Om?=
 =?us-ascii?Q?VnsmsBpDDOfrMg8TB2tXjFAihFHhdocDkJ3WvRXedRivKmMDnnZNYdM7xLfU?=
 =?us-ascii?Q?rfHDgnURzyCMRTswJhqL2PD+wtwasN8zlB2MZ8eHiGk6BmkbscYQmXMJGYCB?=
 =?us-ascii?Q?AoIDLnL8sVGCUZYnqKKl5dkXZdeNaMGdrN6NDQXiFYUOooCIaJZVQapT0UWE?=
 =?us-ascii?Q?JnEjDGfZZrJX6hKgvyeIPy4MJKYpyxyvv3zKNIDn7nXv/qvr3fWiPhz4QeCR?=
 =?us-ascii?Q?Ly0V5fFQnIMzBl/wEzdFWxNfZ4M4sL9y6Yuo+T48teTcKRZqVHHE6L7yew3X?=
 =?us-ascii?Q?8x1IMDACsCkbAhrwj2YeCawyhiajIMe/vF0onQXsvR9I8D2rNdMIKUPeYLGD?=
 =?us-ascii?Q?7L65ym4Flqx3yAqZkMPCkBrbOYAZ2uNy5cEKVxNgl07x0j/5vjycReDM9a/K?=
 =?us-ascii?Q?k/h50sjOMbQDZ1mn9Mavlq9r6Zbhzj3+CqmeGsgmSpPStoBS6mil37N8YGAl?=
 =?us-ascii?Q?VLYN0CjPruZiTCF6mShUUTXnkS39CKKhruB6rz4a4GjFuoGWohcG1Du/A9eH?=
 =?us-ascii?Q?GklEb0LeLjWG3jUZXDMUxpDaOIntWuJCzSsmuNpO91uqdn546JU0iOpZRufp?=
 =?us-ascii?Q?K/1juY8uXtATx5BT3i6Gz2fUmuzPIYJcTo4olrGnxe8j7Zz5xjKjgnzj5fVD?=
 =?us-ascii?Q?e1fuwddYwIvDtXxqafP2ZbHioXAW8ZghDUPP+OcHz0FcX+NX4Rn4BnTTS/9b?=
 =?us-ascii?Q?OcyoFuFe8xDEHRe8JbjMrv/GuHJQScxIS/xLfPWg9zzN4ap97NmEiNuWwis8?=
 =?us-ascii?Q?hEKa4bzO3/HiNsO0ctjGA0C/bOB+F8fA75hKyKmNEXa1Qvntnwj+sdRFCSD5?=
 =?us-ascii?Q?Vj6cGaQrYDnW6hmJ7Ee5fvTp8PSprX6i6vCvGBb6/K4yx8CrXKmqmBqgmsvK?=
 =?us-ascii?Q?Tg+VwjHTaXyj0NIOkq3bUptk6qzk5m8m/anr9LyZBdASpnrWhF3M/TjnZ4z3?=
 =?us-ascii?Q?jDGcW08fg2geF3ZoeVuIBJm+eiUGY1d/PuYYpWZTi7McWPog4VS++vD4sP1I?=
 =?us-ascii?Q?ea6QrHrC3JrOdOgPQKHnIlYVodow1eOE/6TRH5WJw+oXyOsAr3WKUnEdogyK?=
 =?us-ascii?Q?DE5FqXhi9eiHLcDdsSRrYGcdtYJAoAE7+meyTsITHwP6HB+Bbtz2SxHjV6KF?=
 =?us-ascii?Q?sS868/+ky8gjsonYtXBQda0HmEZ6kNaoH4EEQfmM/1+BdjsLX/aTRDsMEu8S?=
 =?us-ascii?Q?W6et7ckFnsvHrQScTAqRvRItscpvxj4FDsmHH/2TPDD5QVSttUAPrvIFBtyf?=
 =?us-ascii?Q?h5P59aBLUJ+GjZkCyTgB6L/sx0TeabACVylHovAwwWGZ5bXcCQgAnT406nuq?=
 =?us-ascii?Q?ac0Vy5z0hVkF8Gt8ulPevI588sSEkQ5hd/3UGjYPbAg+w/DK+tpST/DdU2gc?=
 =?us-ascii?Q?h4W8y9xeHhyopHyO2+yrEbaYBbxNX0HGWyPA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0G23y6RlxIoq9s2iBIpvTVQoituE5JhQ1pMWUDghS7QKUx9V7m1eKLNJvws?=
 =?us-ascii?Q?i3eSB3U+L1m+HpP4CDqtUkQeWKvJEBHPuMsJrsTQ/T6/gtTo6p3Q02L6sXHO?=
 =?us-ascii?Q?9Y0HCz3sKvW4zg7RkKeAjI3A1V21Q9t79g878XgpJac/Yby17GpC1sKqMJWZ?=
 =?us-ascii?Q?XR/RYRrSEGA3+cMnUSs9DV9lOAUY27C7YyGjKNhDOTkG8ET9CGj+6Hr6PYfS?=
 =?us-ascii?Q?S8NFR01lMgDCQMICx6Svp52AqOV6q/vv0Dk6ic4yfZw2cZig1jviw/4JSn+E?=
 =?us-ascii?Q?bRm71Iq1D8+lCoEPl3lVDp9AyK5ItcQBorxNqlwdz+caQ3A4fYGeH9tp3XTB?=
 =?us-ascii?Q?DQ1On5D5B/dKy7FTUSoFOPfTMCgppEsfb0lTkWP74FK3u0+qq5d0tojVa6kR?=
 =?us-ascii?Q?bG8/R6IqkxUdSWJG0yg8r8ldJmeJbEWrf71Sa+N4zZ7RlRah8arOMk2dF7+s?=
 =?us-ascii?Q?/ifu/kv27M/mPFpeWyUuK2fGcQtG5fWmChjwIjcK1BNHUJhwjgEjQMVCO/W3?=
 =?us-ascii?Q?Jo27+4i6y/dP6zJ93oFAHpFJQCMj4srlQTHBrMcsMEw++Bqdd756wIpTy+W1?=
 =?us-ascii?Q?FhqELvv39ZMyY9poFEsoASfFIkbA/A4RLJwDDiWb1838KQ6hZnsdCI9rmUvi?=
 =?us-ascii?Q?0ScOPGM5Kz8xoPJYp4jGapMwrMGIu/UtdKZFLlAZTYFiKlbrcES5THSkom/H?=
 =?us-ascii?Q?Z6qhRLpcMyNiCIjjABPs01iJs/EAgSbZm1lgs09RFhYUJ1fevSTtjWVh0fbx?=
 =?us-ascii?Q?KfszjLDdo2FGe/l1KqyVa9Ds4iSlGPlLj1vzctxbnxspNytQdIkiVNcJnOua?=
 =?us-ascii?Q?pF1XYrfqHLxYV6xfVbRdzUjv85bs2Ir+L9PnmXKRRb4IacqsQL/jmqPLIfSB?=
 =?us-ascii?Q?SEoescR3jt2VSIztqFd4GU9yvdH5MtKhFWhgiecTBVvIfEhVEJn7nIxzhU/z?=
 =?us-ascii?Q?0n3PSWFhMMItdF4yU2tLFgaSCuQHiPu1o4ngSHTDmLQ3b6m6C2XD54GFsydy?=
 =?us-ascii?Q?OB4U95QlKalkyskxbHD/ej8KAH2sAPN3V/UtJtHOMYQL4gr+G34OcPbjtIaO?=
 =?us-ascii?Q?5LNQkZ0tCaXSNZETIYWhfeCCnoV3Tbrls9bPIE6wnsP8da2S0mMJ6wELETfO?=
 =?us-ascii?Q?MKWIHHlF6KOKCETIqBV0UqacLPu5z6l9XjgWfJ3lOcyGkdR8dzzMZD9F4r+i?=
 =?us-ascii?Q?Z+1O4U2e0EAVZy8BnNg0f0HlZTKMQq+V7V0TiHA24FzTXxlKF2DMPe/nCIvx?=
 =?us-ascii?Q?O3u/S0PNWiMRKveTK9Yyo+LjJXq2SRdvbJ8BsKhCaxA0H0vy1XABFqvCegST?=
 =?us-ascii?Q?aZokU1F5BRdw9LeMjjnd59M6UHvtQcpsqTuVC4Dq0BYekJjMqDwPHoKh3bhC?=
 =?us-ascii?Q?sQygIR7mCb1lOp6oX7tTCuuSlbmwEcPnOsZXV6pJ8/n7l/T2/oIig290zzvT?=
 =?us-ascii?Q?/5GDMNcM7xePUuejTa1BvJ0FpayjJrCLuN/amsFX0iertZ38gthvJJE+43xH?=
 =?us-ascii?Q?UlPzRON+dQsVX33wNXlLGrzg+HhtFmLee+TA+Wiu1/zyxlOJxaCH16d6gL8q?=
 =?us-ascii?Q?IB4WA9b0WuWF5V2Y/9c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b1c14b-d695-4076-b052-08de2b834497
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:59:52.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hxoIvsg0nlwyS7MoY7nqzc0eW+591QkKdaVs/0lA8nNkj3qhS4IQaks/8uftCjtViC4Fij5maCUqMDg6RDMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100002_599340_72730A14 
X-CRM114-Status: GOOD (  23.64  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, Nov 22, 2025 at 02:00:40AM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C controller supports automatically retrying transactions
> when a device NACKs. This is useful for slave devices that may be
> temporarily busy and not ready to respond immediately.
>
> Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
> adjust the retry count at runtime. Returns error when value exceeds hw
> specified limit, and the updated value is programmed into all active DAT
> entries.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 69 ++++++++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  2 files changed, 70 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..e228c60840af 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -204,8 +204,10 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> @@ -295,6 +297,64 @@ to_dw_i3c_master(struct i3c_master_controller *master)
>  	return container_of(master, struct dw_i3c_master, base);
>  }
>
...
> +static ssize_t dw_dev_nack_retry_count_store(struct device *dev,
> +					     struct device_attribute *attr,
> +					     const char *buf, size_t count)
> +{
> +	struct dw_i3c_master *master = dev_get_drvdata(dev);
> +	unsigned long val, flags;
> +	int ret, i;
> +	u32 reg;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_err(dev,
> +			"Value %lu exceeds maximum %d\n",
> +			val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
> +		return -ERANGE;
> +	}
> +
> +	master->dev_nack_retry_cnt = val;
> +
> +	spin_lock_irqsave(&master->devs_lock, flags);

I think you'd better to hold i3c_bus_maintenance_lock() lock to make
sure not transfer on going.

Frank
> +	/*
> +	 * Update DAT entries for all currently attached devices.
> +	 * We directly iterate through the master's device array.
> +	 */
> +	for (i = 0; i < master->maxdevs; i++) {
> +		/* Skip free/empty slots */
> +		if (master->free_pos & BIT(i))
> +			continue;
> +
> +		reg = readl(master->regs +
> +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +		reg &= ~GENMASK(30, 29);
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
> +		writel(reg, master->regs +
> +			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +	}
> +	spin_unlock_irqrestore(&master->devs_lock, flags);
> +
> +	return count;
> +}
> +
...
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
