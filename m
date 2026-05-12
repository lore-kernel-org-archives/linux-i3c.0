Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48499CD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVO2lO5UkDch7ZC7SgAI3RbHd5nY7BaMwqmmMeQ20kk=; b=QaaQGZFAyS9qK4
	V3gFb8tpNl/IKvQrGW88B3BRIhK1JJxyj+yBec4k5/WQHJ9D/xnkWzB7JfK9MYWlbpaVUZomgfbQd
	7ioOHuaFeRHX9AwiTmv3O+3QhSbV1MNd6AZi7+LEyAxvR+qKwgOZmrJKDH6IurjZn9pmhHa6icg59
	TSB/xfqDhaNvVvLX1fJbILDJxeOTeYAgzGznRjiA39FWz0Oafv6il5Hy2AbvM0C5D9yInPvTzC/L3
	oe2KFyIR6b9vLrcvdxlr/d7639vnW15pQo2NafIEgU9rfrKTb98/N7sSHzevkRneojwt2VGkrIVFr
	tUc/eRMg+rJX/Fx+SKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrdU-0000000047B-0Ajm;
	Tue, 12 May 2026 18:15:16 +0000
Received: from mail-northeuropeazon11010020.outbound.protection.outlook.com ([52.101.84.20] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrdR-0000000046N-2ra4
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 18:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp2ReQXW0E6dBIJpPlR1y3LoNVcY3lbSc9L7OIs/W1gLWSEnrJWkczjkabMiAulOVKJCRRjMdNzhM+CwPPHZCWoQfmkPNvfh+R9LvuGQzzZcWq+HBpdUU0FYijKiymFk82n6EXpdK9KzYoBHjtoFzUqDVm3KWrKtL75K/XxoIr5ZycLfyOojaisPGulkgDxPdhceLKLf7VxAgrN9PSyEp94fKXHZn4zVjNHRrRwWQeGSDPXmQZfNhYmZMHY+ib90fgTgMWcHyNG8UOuDmr8k/lfk8o0CzxsijyU3INpQz0Rthgq8KWh12Cl5JEMjnaMQlRqh2SmvdMgcZCl1OIhNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zqt+sZIydpjD5n0yAD1LQSeiye1tgdx4Bea6X956SU=;
 b=WbYkA6zxafoo3CFgL4xT5tXMJDlsAdvYYDYcLCy8d+gBYSyBLf6jWMsxNrOHQ/zUuv8JLmiX8oFETuLRcZhcErJSTyYY/r3Yytp13zRcciYNIEY/hSujfr/+kLDw/B3BSs4EPt81q/KQNaPE8A9oUbEXUOiLmGXK/uivRK0dAG+o11LQJcK8Y+R06Wkkc3spKEY/at/i/rlkHtRRaX6VRpNk/tWuR5K/ieNKff+GLY16iFEytQ0GdsUZUFlziUyMjSxd21mJynznwdvwJKkp0CUpSXpPJrL8iu5JVp7/rE4x0iMoIZwArmjx6lbQM5/R7fpbpXZ39IcvNQn1wH9+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zqt+sZIydpjD5n0yAD1LQSeiye1tgdx4Bea6X956SU=;
 b=mxfvzQMPGHTcPHkieqoG+iB0Fc/7joKnr9rqkU/JG4o+s9JW+q1vW2jQj35UHVoGh2pkHYJXhlferlS2SAuLWKRa8wPor2NUV+hKEGyvFDKk/165iMB2LIdt6wt3SyvFrIJijMwWhTZhfa/2fL+GmroHbF4mB3r/nOxiycIePc9ds1wKQk61X3Vz9TTI53SLNzi6qmnR8kEDbCO6RfbHUfmv5k0nRdD7XU6O5JGiA2gkL6vV9ms4S12VKKEfAiYOIn6uolftFILZCFVf2ejylilh9ZudFzl/Zwtvwb0JVFK53xpSgv0uPJi0U5wazB4z9PRgMHGgXmm0TRLKzgAWtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10082.eurprd04.prod.outlook.com (2603:10a6:150:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:15:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:15:09 +0000
Date: Tue, 12 May 2026 14:15:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 15/16] i3c: mipi-i3c-hci: Consolidate DMA ring
 allocation
Message-ID: <agNuJkSZfOLHLTTE@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-16-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-16-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10082:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4fb681-fa28-4afd-cb2b-08deb05266cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: DLZ9pdjTK7QSP0yWTMizelFepxO75c7bAVnP+rTWGT1FJKlDOzDDebxcYaPrkBuL0Tt+cWDwZGvEMvMSZyRaVvJ8LBfzTrBHpCWyd8D7kWlAa8+CGFRzI0vG+aawTJDfXYDMWUBQyyzo7EbvgVaIZC4xtrwBZqz38zdG4+Fjgg2izjkrWD63RrkhsngU3cm3zClZElQeuXeBqp9MbPTuZ4RLYhv0AFUlZb5OYwzJdc3R1WsMvFfyaPfGgaEyh4PhGVfsZJ9y18LtpSIjFpXTkQPmLGLqnn2C7wED4pvRk6UaDNv4ActyayPkkjrM8/iBXr2FxyaAFtx0CPCWlPpFH50BLxnR/R4d9Dt6FSxGd1lenji51vyVlSVZiGWIVNs+b0LYL2z59yhTC1n6MIJn9seLiDan59VgAZh3gBoyrjrRR8sesCsTBaO3Kp7EHEh/r9EFCm9jjfgHpBcYOKovu7p/E2jqI8/BUp5Gn0LjmmSpU48qGkExHj/EwjE61/3qOKK7dyv2Eo1io7Gek7K+u9jFGUS7O+eZ6tjSosLRLvh6scEmM0M5fm5sAt0bn9pJsF2mdYpNjB544hkwEhlWkKRStXpb/ii70nd9IripFYPYe4EYQnHiSqlGnkynca3911ciutVXyhZsi5TvOVXAEsGrXDYbouPETNW7QKQ4d7H0ma+CIWWNRH/1z8BWjdIeyF8+mdXdLUGS93e46G7UoMkXGTX5DiqcO0khXyBl1XG9yOtegAE2PBGXv6BwIAlI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHg24lWJcQoNEa72mn0vm1xZ5NxDcEvIJgpjS+g18l4MIrPMb8PQdbMDSPmQ?=
 =?us-ascii?Q?WjS0wqSohAg/5OXuFiC8AUaadgh/Z/52U8mm0g/yHRY6dshAWVXt533QARO1?=
 =?us-ascii?Q?p3nzwsDjATWTP3NBRU5xMCDgAQoq1r753aHCGS5JVIn1NVeitHo7MM3TmETP?=
 =?us-ascii?Q?ZeyzsaqBq85l97CNXavIfSRRao6LllKFckbGK0C3Pwsw+ma1/VfKXGlOlm+m?=
 =?us-ascii?Q?IHFcQcSK/VqfnNXa+SuqNRz3L6Ber7KgGwqu49ZgXW2CiUWQDt55R5eIMkba?=
 =?us-ascii?Q?ow1NYHSp0wmoT8L8IuFTp1TWYnZVTIbGDJo67n/rRFzByBkm/XsoUzHGIT11?=
 =?us-ascii?Q?uPMSpIxcVH8jiBofcitiw87NAVZaYR2yATY8EwwCq1qSzvZwi8GRXk/DtwEL?=
 =?us-ascii?Q?8J0iH88NkKQ6ru447kcq2bsTq4IbEI86QaF6jvzg6qpaE2jXohYZCRHTz3T2?=
 =?us-ascii?Q?ZGn8kcY9gKp6mJYSEybPt3mplzJjcV1SBkXKGGf/DicdFxzKFEY5nH1U8LtE?=
 =?us-ascii?Q?j5eWETipUyVMFaYLKBhkVcif3zqGEZ5CLgj2/gG9cx5NKGMzVQnctJwCuzt2?=
 =?us-ascii?Q?SLO/HaKhF5BPQ4GhnLFq+b1ZVJYKb3Vhn6h3RecAnbGW4z/KWJjXZNjINreH?=
 =?us-ascii?Q?q7N+OmfRb6mW6gS8KJlSQ3YONTBSZp+Cq4PDOirNBLEZE0cZAfBd2iXI+shC?=
 =?us-ascii?Q?PQr0Q5ke4uac8aH+RMa3huPPyNgN4Il0R2MADcGjb3PPVhB4oYAHk/RN6Tbk?=
 =?us-ascii?Q?c7vI3Vimr3ukfGxJ2TB5DCJqOuOJoHA4Wb9UN5pyb8ewXfhnZamOsYR8+E2h?=
 =?us-ascii?Q?fC9wvfTTx755mLXFUaT2caAZDAHKmQTKXdXEGWWoE/+y4h0WQRt8i78r0X0N?=
 =?us-ascii?Q?Ou8/qb9WCd7ODVbxPgFPvc2Yu3EGJdCUXULDHgxhBMGSThNu0LfLU8yAIUFA?=
 =?us-ascii?Q?oTX6QZCmVIf8HEBh/5yyRSfF2arvpNJGUERIeVO5FY29gKp/GJ9/RlmwZKGP?=
 =?us-ascii?Q?UNy8Yt4oiqAg1QserJJVKfZZvdVDUMZtP/m+d5If89ox3AevLC3qwUTa8e2/?=
 =?us-ascii?Q?z9d7DxU0TWlKmWNy2t0UqFD6WRGX4daMnKj7Vz4nEI3xayM/bFOMwHJsVaS8?=
 =?us-ascii?Q?bSQZm3Fm7WJZkduwT3g17HOkhJ5MdbsP2d+YjWQ81z+fVkE0qeEwqLAEBHPD?=
 =?us-ascii?Q?MOr//WqJbYV5k+WDvPzKOHtoeeURtYJdQHNTF0H1JJvzOopMnrShnhSwMZPZ?=
 =?us-ascii?Q?57GSSY45h/qmks9S5/3qEza2shm0Nsoup4X3GkNFLZpMrw9Vde2qbvjsRMaU?=
 =?us-ascii?Q?I7podJAmv395iB/6z8w6Tp3it5DCecidotZJBgEmzlShx0M26MdO0WeZElZZ?=
 =?us-ascii?Q?mptD2GC6TTDyIbgSzzfumGbA/uuTymMw3W3Vu19FRsOE5SmVbo1tDhxhMUK0?=
 =?us-ascii?Q?BzyoJ04CycsUm1+QqpmQm08TC2pqiZH14Im7tP3wT4UsdTd2KvWJqNPvhvFa?=
 =?us-ascii?Q?nysN5X+Y0NkXXBvUsOY+YX4cY5wHwRX+p05nETPKcw7h7IrkF+cdjqotK5ii?=
 =?us-ascii?Q?p9JQERGK8jVXWFOs6V9o7pzh3Kw0ut4AD/euiMCkVpZEDFqKwxdFMflDZ1vR?=
 =?us-ascii?Q?ZpPzAPOoUAGEbkYi3hMKPglxu9u1KujNHVZjgsOBi1jeypSj/f//U7km3vZL?=
 =?us-ascii?Q?a0D1QOu/TkOfSI881LxI+wFbXZsDSihNPNhNK1GGn2JPR57T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4fb681-fa28-4afd-cb2b-08deb05266cb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:15:09.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQRdulshkh1sGoyTgfGlRMh9wmhQvKvBwK6rWAjJk3DAn5TRQT/8YwB7g/L/ud4MnKF79okSUGmLeGSXnd+Hrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_111513_725007_CE90E4FF 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, May 04, 2026 at 02:33:51PM +0300, Adrian Hunter wrote:
> dma_alloc_coherent() allocates memory in whole pages, which can waste
> space when command and response queues are allocated separately.
>
> Allocate the DMA command and response queues from a single coherent
> allocation instead, while preserving the required 4-byte alignment.
>
> This reduces memory overhead without changing behavior.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Check for failed allocation before assignments to avoid doing
> 	arithmetic with NULL pointers
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 6440302c63ca..4029d4d9e784 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -186,14 +186,12 @@ static void hci_dma_free(void *data)
>  	for (int i = 0; i < rings->total; i++) {
>  		rh = &rings->headers[i];
>
> -		if (rh->xfer)
> -			dma_free_coherent(rings->sysdev,
> -					  rh->xfer_struct_sz * rh->xfer_entries,
> -					  rh->xfer, rh->xfer_dma);
> -		if (rh->resp)
> -			dma_free_coherent(rings->sysdev,
> -					  rh->resp_struct_sz * rh->xfer_entries,
> -					  rh->resp, rh->resp_dma);
> +		if (rh->xfer) {
> +			size_t sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
> +
> +			sz += rh->resp_struct_sz * rh->xfer_entries;
> +			dma_free_coherent(rings->sysdev, sz, rh->xfer, rh->xfer_dma);

Good cleanup. can you save sz into rh when alloc it?

Frank

> +		}
>  		kfree(rh->src_xfers);
>  		if (rh->ibi_status)
>  			dma_free_coherent(rings->sysdev,
> @@ -359,18 +357,18 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		dev_dbg(&hci->master.dev,
>  			"xfer_struct_sz = %d, resp_struct_sz = %d",
>  			rh->xfer_struct_sz, rh->resp_struct_sz);
> -		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
> +		xfers_sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
>  		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
>
> -		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
> +		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz + resps_sz,
>  					      &rh->xfer_dma, GFP_KERNEL);
> -		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
> -					      &rh->resp_dma, GFP_KERNEL);
>  		rh->src_xfers =
>  			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
>  		ret = -ENOMEM;
> -		if (!rh->xfer || !rh->resp || !rh->src_xfers)
> +		if (!rh->xfer || !rh->src_xfers)
>  			goto err_out;
> +		rh->resp = rh->xfer + xfers_sz;
> +		rh->resp_dma = rh->xfer_dma + xfers_sz;
>
>  		/* IBIs */
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
