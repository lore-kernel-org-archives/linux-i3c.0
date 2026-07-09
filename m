Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D0C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHdj8Tfh1LACzXCV1SzZeCljEBzmWdM3PAVeB70tKt8=; b=msNZxRepKVMfOi
	1Tl1yV7tDtIfQCiF8xblhx/F2GA8KgUsHJ6BtJjJweCTWW/ebQMza9Z/YqcOFWKMIOhZ3AZiPQLKj
	5ADX2XTuMFqE/hraRrvKey0UiWTMMZkaCHYrpicQlGX3d00wrtx2BxbNUW/sh0sahxUdik3IHRp+3
	qzzj5Pvt2CjRhR5SZS5/T2xLHDKjqEYDKkkC81lAm9rXVTWEiQUHqf40oaYOHiPwR+ZrNew43HEv7
	l6bKqmDhvFJOWBlsOIfFRpDAwUUuOXZFbE+OWrL5Pjo9g4kdFNqg3UeNm7AVt6Rq+1IJXOzh1fGdo
	hnOtUa44FSI1o2bfSKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtwE-00000003Kbs-0CDF;
	Thu, 09 Jul 2026 18:57:34 +0000
Received: from mail-northeuropeazon11012018.outbound.protection.outlook.com ([52.101.66.18] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtwB-00000003KbK-0vdb
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 18:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/PUChUn7X9CaQ19V3hwg9ubafETtfVd8nXSTquVqG1mT6C/gF2lQlqDgOdjnEktjwXV2270QVPBqhSD3wlPVd3j7+PHDXPZdu6GVxAnOl7je19Tw6HMfgd2eyy8fTpkWKI2kMqoyQyQJgTzCq0NQ+s+0f3YQ6XfLGgYDDjoQxI+9OLbxO8hTIU/pGE4sNYihb5rUyd5uci+p2n2PQXgie2IOq/ra/0erUd8h3zPK/TBfA1oRanQjvebRNc22Q6RTdm7Oo6THcTPF2JipNp7ksbbDZkVXfB8LRfWAmlGqwCfgRATl5W0PKbdq/5Q1/S1HlXtWOoYn4ICU4GW83850A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rfCZBeXXaJhOwRlv0pujm0OvrQ7X2hzuQCdNbdMJTE=;
 b=rQv6a6BL2OpBe6NOe9ZK/ZzGJxNgcFOKj7gu1eisqfl3i1Ht/jabivDsBuuLZtPiN9xGzhc/z2+4Vpbvlpm3GJo/mqnHHhqmazXO/Xk0+PoC3Dy4GpsLZG7r1m5tj0BX5urDOyN9sQZnCuJmgohQc59EmV1/HIdaH0N/QXt49+idouhGSm52ZMH3FQP4MGMYiPisDabPwH4odrbBpG+udAzKjMb+Av6I2+6IPIOXsKtg69i8XxQrDG+EjzGP50BdFbM/J+8lFn04yFD9TrAfOnA3x9m9pa3CldDbufrdXA6PmViM9SXuPJ36YgIKHldlgRxXw3ladejYlEnkTv+TTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rfCZBeXXaJhOwRlv0pujm0OvrQ7X2hzuQCdNbdMJTE=;
 b=hTkwKteByTznbz4rBGqVwCc8wrLbJrcX5vVTZ2jXAiF/TaY92UjeQ9NDh7adg/zDBX3BKWv1fSzkv3ObzFdp/25JKTfPm+pjQwdK5kCXLIh0TArERyFwVI6W2NxW+A7LZ0bQkxGzpbiKrpd85ixqA7MipR2ymnDRpG3NqIuT7jls4oafQWIppMxmvjqwtkAnSQCgoOf2fHzNgVj/hXFzY76nVB/aMVYQOIje+ksjKUYja63c37HERk9G07lzoRr2W2xz7t/QdfA6J9rikz4GBCpSc4ykl6GLf5Sc+G7T1DjcpQvMt23U9ZzcGSRJWVUeEpTT5W9WwFdWWj0/BAO5iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8806.eurprd04.prod.outlook.com (2603:10a6:10:2e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 18:57:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 18:57:26 +0000
Date: Thu, 9 Jul 2026 14:57:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <tim678910@gmail.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add PIO queue management support
 for HCI v1.2
Message-ID: <ak_vDyq9A60mGmny@lizhi-Precision-Tower-5810>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260709071744.333403-3-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260709071744.333403-3-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: PH1PEPF00013309.namprd07.prod.outlook.com
 (2603:10b6:518:1::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea9031d-8135-41b3-6f4b-08deddebeb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nT8k57/dgoZJiKa+og/NSSzRmqtMM3CjRjjrKwZ/ogT4mb8k4KzGdCvnQaWSaziqntNaGiEDfjlkJqhdBBzhni6OureAPBCvahtqhQxoVlvwGje3qM8dhCbKUDdBheDmhNY3a8Kb0gvTpNjCCRcztJOJegr3TBAiR2kq3zA5xAVjQ3HJIbtqCh8gYMS9rLNE4GxvEYIBM5G9+n1i8lOzhcigUmE7+v6RIor6QH6+QURPQ++NZw9CWQOfYtzssesxYRfxomS1TvCEiwrsbvSV9JRpw93G6HhaNSjjgC7C7ncGjeeYwFIDaPXWhLqz7kbJN3uUxI0D929pSoQQTqCIxPuW8PCzpxN3gcolaQtd+lFF1Vuq0OUrgc8uO4RaoalBPE2AvWA5QNoWj0WXglYBrhbCA8WvGQ+JfRpxmyJeGjURKxtY8WFnpHB2EGifLbxe8zm4CU6gQKIk0HstMmVIjHsiL+h3ikvfmL8OWl3siXykQH8bBzhIM/TsBK/WwW0UUUIypcf1D98C8qeVVFi6eqng/z4hq5XXMces7sp76RZVTCXYGfilN4Op4Uk0Vr96uFtra38chiydxkj8LmPSP6hiJZDiS/TN1b59UIni4cYWNJuuE8ccHYqMRvbm2qHvSVzcIyCeymVHUgsUEoAheAISl0VXoS+yP0OMqRs/SqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GDFYcpqZvmrmSTVlaiwlReOR+v+WA31XN1JUVWAFDqDnTsIlVY0y3jyDi6qf?=
 =?us-ascii?Q?VgbBD1Z4wZVpu+DpgGzp3mBACQ1tW6gDdTZev2kfC5uEZ2E7T45BdkUmzSxL?=
 =?us-ascii?Q?VEH7ciDm0gc3kMgJqyICXKLkfTnmndErvFEkj8gx0o4mUBKslKoy/R/VHiaY?=
 =?us-ascii?Q?2p1/+rMB2JPcaRb/fnd88V6LRxTWPVaYB3Nkq5m7wPcdMDG9KGLDVh7afFaw?=
 =?us-ascii?Q?gME0M2arkQNzGGo19fbreq4AffQtLLwLTmdTfh7zOkztnHc6Fkt8vvTrH3KQ?=
 =?us-ascii?Q?bHUu1UqotDm+InraFxmkktfLT/OnLQvmxKnXjnIpr5DNV5PDt/+ALjRW/HFf?=
 =?us-ascii?Q?0dJxP/ffZIPImPoX/PGtNNJCPbvCoB6ENTpvcN+mZS/S0toDOHeTLE+AifSF?=
 =?us-ascii?Q?LrAkwGQpsLmZUzpPGiqDMe3eK7ZO12VcQT/sZFjBDqxK2bKVqz2bZBzWETsY?=
 =?us-ascii?Q?ad2fde36MUEPBfLe+huteZ9zBBcegFVdV8vXVIXxU3jIBRphLCb0yB6bfvXT?=
 =?us-ascii?Q?aF9Qy8rPMJAH4p3wi96sM6ZnB43raLWDy3+ZE/VBwo9h3OrfkQ4XFui3ltfn?=
 =?us-ascii?Q?MW/erPtCv918V1vahZfUiiL41NwIDiMe/ZPDUeK267NJ70flEhMKl7Yub6Ry?=
 =?us-ascii?Q?JHGHtP06mxRr83AMfhK74CCJY1X7KVawH4rK8WA8ADfdu2/pdCbYHLPT8zU8?=
 =?us-ascii?Q?hAOXB41duGSvb3Boioi/wiabAszUqYOnVOPaiKJkKkbI71d5HefC15lBumiI?=
 =?us-ascii?Q?LIsySvskaeaAC9RyObgpFmbe9WqxnUfOpXok7geZiOK3ExYpjfDD4qZrB9Rq?=
 =?us-ascii?Q?/azk7ejOQuz8Lfy3ENa6TiJx696b0lIymeBaxFrgR9yOiDt7OapJpkLFkaiK?=
 =?us-ascii?Q?BiHRY+iYGl6Uz+hlrDh//8pXkTj+f77Mo7eU70L4+c5DM67XMTm1uKl5JpGv?=
 =?us-ascii?Q?Fe3nee4zParlTI5Fd9nSXpvswhaW/giBRKrI1wDt24osCfaMMjWzp7Xm5Ylu?=
 =?us-ascii?Q?hCv/E+wK1W7k4HYk+QNsgrNG1/JEPQuz+deiYpWEmcqyI55UwhrD83UL+E6r?=
 =?us-ascii?Q?iaGr1pYSldDsOgA8kuHG3LVmT6IEQV8CU8nyOcERvB5WyH7NNsDyjPCaJTfP?=
 =?us-ascii?Q?UJxC6GfHLAo8wbxVFn7nVg9UdVKsWX60LIPjg1PXrbtloDkomXc9PDzuAE84?=
 =?us-ascii?Q?PImiZ+gjQWtpr2DYtg2aY66IIiPKeDsNIirO9dtapy84R1DDGh348WReEVBp?=
 =?us-ascii?Q?kyfHkhDy3/ujIZSakzqW0y1ZE/JaqPAcAZC/44CeBAanxewdCSjus16D2WBz?=
 =?us-ascii?Q?VkyVZfuH9TwUz+Riy9wjwUP3GlLX+B/dcBuxuLtdhQaPbmZG3OULb+B/Bw4x?=
 =?us-ascii?Q?CDX9xCanBIveYlcKyYJNv6nYyZvWcORGAvJcifnWsfx9Yj7QoPEa1DDgMoHi?=
 =?us-ascii?Q?A4bMoU753gs4QaJlTYFu7x0i+VkZWtur95xvFtC05MZkeEEC7i1apXgGO8Nt?=
 =?us-ascii?Q?1InXKU2GTtuSIOUQbl+f4RPi50hr38xdBCUMEHyxkTw7hO1ZjTGg3gGQnER8?=
 =?us-ascii?Q?KSF8oam1Ebn8A0y9TlpN/JGxvCm+5MmovnFd99msEazG2JTaQW1F48qcatIL?=
 =?us-ascii?Q?QgAvpy5qNeyQINiOvo1ID9gE5wYKVeyrZQmDX43WJIft2tjtUJ3eYkPW8fKv?=
 =?us-ascii?Q?498ydnCxHDf2gOcQM2Jrq4hufrQHjI/COh5kjy5Y+7P01VUDmx48QqfEux30?=
 =?us-ascii?Q?Qm8RfWBHM11nuUZCuiHHathZNHS2DW5hXxWFGBl61uhqadAYbcGU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea9031d-8135-41b3-6f4b-08deddebeb21
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:57:26.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qicZT6F9MZ39ZXoWWBLhezON5kpGmuiEbwoj/EQGnFmku/U0u8GRqJ0VS4RNFyLSz8yw5Vr0OZhocyXRltcNCN8tDQLm89opgbQgoRS5h59q8J6uyxl6mW3PCDU8Ul1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_115731_426927_E67CE163 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Jul 09, 2026 at 03:17:43PM +0800, Jian-Ming Liao wrote:
> - Support explicit enablement and starting of PIO queues as
>   required by HCI v1.2.
> - Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
> - Implement explicit PIO queue stopping/disabling and restart
>   logic after errors.

Remove -

Support explicit enablement and starting of PIO queues as required by
HCI v1.2.

Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.

Implement explicit PIO queue stopping/disabling and restart logic after
errors.

if you prefer -, need

Some sentense ...
  - abc...

>
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 72 ++++++++++++++++++++++----
>  2 files changed, 63 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e80aa1f5722e..dccc974ef15a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1031,6 +1031,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	switch (regval & ~0xf) {
>  	case 0x100:	/* version 1.0 */
>  	case 0x110:	/* version 1.1 */
> +	case 0x120:	/* version 1.2 */
>  	case 0x200:	/* version 2.0 */
>  		break;
>  	default:
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 7870b2c7888f..c05fb3666378 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -45,6 +45,11 @@
>  #define IBI_STATUS_SIZE			GENMASK(15, 8)
>  #define CR_QUEUE_SIZE			GENMASK(7, 0)
>
> +#define PIO_ALT_QUEUE_SIZE      0x1C
> +#define EXT_IBI_QUEUE_EN        BIT(28)
> +#define ALT_RESP_QUEUE_EN       BIT(24)
> +#define ALT_RESP_QUEUE_SIZE     GENMASK(7, 0)
> +

Number start pos align to prevous GENMASK(7, 0) of CR_QUEUE_SIZE

>  #define PIO_INTR_STATUS			0x20
>  #define PIO_INTR_STATUS_ENABLE		0x24
>  #define PIO_INTR_SIGNAL_ENABLE		0x28
> @@ -72,6 +77,11 @@
>  #define STAT_RX_THLD			BIT(1)
>  #define STAT_TX_THLD			BIT(0)
>
> +#define PIO_CONTROL			0x30
> +#define PIO_CONTROL_ABORT		BIT(2)
> +#define PIO_CONTROL_RS			BIT(1)
> +#define PIO_CONTROL_ENABLE		BIT(0)
> +
>  #define PIO_QUEUE_CUR_STATUS		0x38
>  #define CUR_IBI_Q_LEVEL			GENMASK(28, 20)
>  #define CUR_RESP_Q_LEVEL		GENMASK(18, 10)
> @@ -138,11 +148,44 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  {
>  	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
>  	struct hci_pio_data *pio = hci->io_data;
> +	u32 cmd_sz, resp_sz;
>
>  	size_val = pio_reg_read(QUEUE_SIZE);
>  	if (size_val_ptr)
>  		*size_val_ptr = size_val;
>
> +	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
> +	resp_sz = cmd_sz;
> +	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues
> +	 * and supports alternate queue sizes.
> +	 */
> +	if (hci->version_major == 1 && hci->version_minor >= 2) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +
> +		/* Adjust actual FIFO sizes based on v1.2 ALT_QUEUE_SIZE */
> +		if (alt_val & ALT_RESP_QUEUE_EN)
> +			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
> +	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
> +		cmd_sz, resp_sz);
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n", 4 * ibi_val);
> +	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
> +		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> +	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> +		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
> +
>  	/*
>  	 * Let's initialize data thresholds to half of the actual FIFO size.
>  	 * The start thresholds aren't used (set to 0) as the FIFO is always
> @@ -172,7 +215,7 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * or one available response or IBI. For IBI data let's use half the
>  	 * IBI queue size within allowed bounds.
>  	 */
> -	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +
>  	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
>  	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
>  	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
> @@ -219,15 +262,6 @@ static int hci_pio_init(struct i3c_hci *hci)
>
>  	__hci_pio_init(hci, &size_val);
>
> -	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> -		FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> -		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
> -		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> -	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> -		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
> -

why need move this part?

>  	return 0;
>  }
>
> @@ -246,6 +280,12 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  		BUG_ON(pio->curr_rx);
>  		BUG_ON(pio->curr_tx);
>  		BUG_ON(pio->curr_resp);
> +		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
> +		if (hci->version_major == 1 && hci->version_minor >= 2)
> +			pio_reg_write(CONTROL, 0x0);
> +
> +		kfree(pio);

why need kfree() here? if fix existing problem, use seperate patch.

> +		hci->io_data = NULL;
>  	}
>  }
>
> @@ -766,6 +806,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
>  		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
>  	/* then reset the hardware */
>  	mipi_i3c_hci_pio_reset(hci);
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
> +	if (hci->version_major == 1 && hci->version_minor >= 2) {

Can you use helper macro this check, many place use similar check

Frank

> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
> +
>  	mipi_i3c_hci_resume(hci);
>
>  	dev_dbg(&hci->master.dev, "status=%#x/%#x",
> --
> 2.43.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
