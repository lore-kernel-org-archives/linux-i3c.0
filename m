Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C760CC7EE2A
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvwF2nPN8YRAQfx7tQr7K0hkx/KNPxZnXmKO359FkVU=; b=uqDpuRh1z9dUXL
	uu6ZYPcFgyxIcnEfbWLRQhz8kcZ1TLEzNC1R30aNrC4r9SqrQyiCK5OkLuLBBqVq3hgjtnjVdDXbD
	+v3Ww+9JSNkum3pmkY1ArY20d5GTrPowIBboI5VxfQrSKH7JQCB5vugxcy/xUbznBRp/rAw/68Rma
	xq+itgi0R2G8CRiHyvtWGMdlckqmCNRax74DaAxysSYCZ4AYtA5Pas7Nei036sCUrq7pNB8iYKOq5
	mDnmrCdXwvHCoSYSfGUfH0idYwHiceJYvZZWL48bdfdFNBR75MZaTfK3x4pLTpDC8GbSNeg+9tXaV
	SRo5gWpX9Q5h6iV9zQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUY26-0000000A0XU-2HTE;
	Wed, 25 Jun 2025 21:51:54 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWlo-00000009qCL-2zQA
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 20:31:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIHWwuSFB3u/6mPD/nvj0aO5iDJCyJnfJeXNfm9LzPOiJMAjLHUmotMk95NbSaQfnUNR6Z35taPLaHNBOxkfOjKOX+WceOMaSf/UrVo5i3hbYxhc7kTYVOjXDJ/8KP7PIr0lqYVReNUB/ChAWcXXE+5sN8X1x0SsZi8DYCeAhszJy89xSTLsBDzXUdRaIQb8Retcw5o9hTNeimDIToe5L9132tsQOvPZyiJfB+wFZb8ESTq8FjhGK56NyONJWAiefNuXGHlthsKk5e+Or7poI4/QuPfs0nN0wYkB5Xion4+LjrOIaanc3DM31cwtNU7V2wv3DB62A6OJP2JJPYfp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzv3qHTfqWKFBhn1uFzXyjwZjGGl03gcG7tsZ7jN6I4=;
 b=gx8I7FhfaDBUPquxJX2rVfT+ssEGoz0M4Ys/hhtlzSRxo8JHeOeSKBy7nUL/rsxeP0AZn1n8zzdSWdSEqAnI2SNbsfBeaYNaQ2MG/4bfdbofdPq59dWtL58oldFUiEPMVatzeENXgIEpg2umB6nW9Z0YqyzA/cA1Y6qkY7pOcFcmkalgtkPc+GD5v//jV3cnv8B2VRHbFe37dPt+GGFOEFwSADr9+TYue5XlJMZwOoPEfeVVJUAnRYY1TefbXED+xh+4Kyq65BElb1eRFHoR57/F5MbUxgMgiscZtKDwzIY/e7CjF/JRw/We/zqGdGg1w23xGa4mDodf802KfBG+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzv3qHTfqWKFBhn1uFzXyjwZjGGl03gcG7tsZ7jN6I4=;
 b=d0Tvw0YfyVUTqP9ZJ+OlrvjPawAmXp10ubPWaftG2udWxQP1G8BdpAypcCYcmKmAsOzlOperimLZ+FKiImfZHxhyZU76mnLq2/g6D4dGkz4DkSNlRcygDThYijdqHKKfgGru7Lt5vNHGvlOKZ+vTuYDQRr7rAt95/qMo8uNgSDWsdt2NfOQApa5+WPlt/0ud8ZcY9EDYqrNSWRMSducTYxWrOyNpSnNAZQatczc8Tag2Cpn9LsZ7xUjJv7EOJRZslEHxAFlTNOFCda6bvipBpLN8jytHOZ4+BTzpUpd++K//MRolQ8SUFFywXZRJiG4puwyRhEHvNtL4kfWv2lq+fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 20:30:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 20:30:40 +0000
Date: Wed, 25 Jun 2025 16:30:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/3] i3c: core: switch to use SUSV4 error codes
Message-ID: <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
 <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 56270cd0-0380-47a7-7583-08ddb42726a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ygd6SXmo6RRb1KdsprWemKT8F5BgvCcqKiYpj38XQeeD2qN5gAe/990SMJC?=
 =?us-ascii?Q?60o51by/mdJpRdbImmFBIBDdkFmPqK/M11tPs+SkwICiB3JOsNV1ZIbHWC/R?=
 =?us-ascii?Q?ebJ4CQwQy8JCBq147x3gi8YJSlxMC764G4AR/NQ0xZHRTdT/6k5kXyt9wIGF?=
 =?us-ascii?Q?zfRR6j31apg1nmJe7oz3VKBpFiBWxdug3+EPepfexvvwAdVcHY7MXoKvcYAg?=
 =?us-ascii?Q?JFnDnHFiPFCL12uNrBnngbXM+ZoBXGX4RJ1gRoiy/yMajQqtZdMoGHbCAmff?=
 =?us-ascii?Q?4x+tq73/KeTZFmOuwHhL+mwL0zh60f2DIVRApfM4d1V/CvSRwCaDv+koupbp?=
 =?us-ascii?Q?AD0XZDXr7XGHNhgKCWBk44ezG/jN7s3rcLRhvEOKxMhiCecB+YvckD6h0qF/?=
 =?us-ascii?Q?SVYSCr4DeWSdVqfzQN+cm0bfPGREHC1uTcAVi1tkbu9FlJDXiTAZqHFt06/m?=
 =?us-ascii?Q?CnpUSM+E1YgeQ0J58QjrRMEEBRTHCOrUJ8S1CTKLwrB/P3bMjR1q3bBJb85H?=
 =?us-ascii?Q?vEUdN+ba3l1BsJharNqIfkQ/4uq6UF6fxSsivL1/dhOHeE0awUHUW50HZA1R?=
 =?us-ascii?Q?ZUB4XQ2sRyyxQRfLA5Apiu4yzoda5005QELQVrVul4aKrkWUFZFojmZBjpM9?=
 =?us-ascii?Q?2+022YIk4d7lpl5aDLK8BlIOIC4fAPt1JkIQM1EqUeKmeAvrb+9jiLwvdtA3?=
 =?us-ascii?Q?1R3XcgoZKzB7tFf9Ho98IzfZ62Of7eTgzrr8KXsF3sWjUel+aIjT8xUdGYu+?=
 =?us-ascii?Q?D5PRqsN9aXEs0K0kurG274lLrNFOlyZEvlu4B9B/muzT5H13S5dfTM6xIg7A?=
 =?us-ascii?Q?IAG8B8FMT2DXwbnFDo6OOXEKmIhQzMNBuNIeZx18g+QIP4pjUcAHUjL/ANEh?=
 =?us-ascii?Q?mRRBXzHF0HI/keK8bUoMbmjESzZIBXqyZiK3xRc8MVhWyJhs28Rz8ww57qzH?=
 =?us-ascii?Q?L32fAoxLxDO6MEd8nAv8meoaL1bQmffqgiyH1vPmUpODQc1QbLmhwPkU25AQ?=
 =?us-ascii?Q?/oM99czVbFxKmaC5A3ldPYPM76qG/FyklAbLZfI2wl2kTOLDSF/1nSDw9p4Q?=
 =?us-ascii?Q?kRDP+3k0foUwZNTpGYCsZhLoWjGgw7iWrGE4TKP1e8S7trLVRcW9TmAObC34?=
 =?us-ascii?Q?ybwKnY9MGcCyJ7aJliK6eGY993/9qOg74qTpUCDfymLDUDAOFUDa2EEW/ZQ9?=
 =?us-ascii?Q?huTob+zogKEweRgNX9+nRUGk4LVgO1uCRk0dWXGnjDfVDlTgpQy6GWB2PfIS?=
 =?us-ascii?Q?kmPFRp1xPimOyGRjPM2RGrNVKpOLZuqd2d9JS7+GxAxIO+bbsmKbnIWB611G?=
 =?us-ascii?Q?1XCjHTZ2v7jfFoiwqjPF719zzry5o26i6ONJVdrGdLWH3A9IbAShZciztE33?=
 =?us-ascii?Q?mdHFdh852tmef572ncghHx1DFaZIQDCkoGkmanU2NOTAQ+eHt28/m6WkgFT6?=
 =?us-ascii?Q?EXUqLCZL6vjbhADE1M2aubAEFswV6QjJXNpiRjXbi7GZfW7iIU7+Bw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8aVLoi2SVwsbIMUntU9/iPDzWAgV5se8uQoC9xXyj+FaUv+H41M5f7LAeL9s?=
 =?us-ascii?Q?50wEFVizJ7g82pFqpvEkAiHMuhOPmhUp0LnKUCWioipR0uCDh7AtNWkOHKYZ?=
 =?us-ascii?Q?XmBgFqwIdXaqkeFmCEeS6beQYZbxDp6HIYamRp5eyUFjqb/Yn+kA0Xst14Dn?=
 =?us-ascii?Q?jEWFoo+/jcBV9pGkVNDo+ag9RmDNczjyxM0rP65VwLeY23TplWgvaUXNq4NP?=
 =?us-ascii?Q?+ZBsWNyfJX3vuzYeBufkGCg92R8JHSM85dNMNsuROw378HosF386wNSPAnYg?=
 =?us-ascii?Q?WbGsikoyinNpCwvaeQUKJdJkwcX2x3fmyC5szdoDO/Wtiic4bQCV+yMbPDyV?=
 =?us-ascii?Q?bxqArovHYtPManTe1PhQV0n5XdsT1ozd3t0ZBd2PlQkkryxuCZEyZmgPoP3Y?=
 =?us-ascii?Q?Q9WYuuVBksnLTyUOJOsuYLwEcgMChNfq59z7ofM1izVRQz2cyoR3GLsd1GZr?=
 =?us-ascii?Q?ngOuI2F9GHfsIcCvXj40IYzQHdLwDUoYmL4fXWxGWPB2/vHiMBG2ACVzBIua?=
 =?us-ascii?Q?f4EDGsxvltuTR18gV/suGOjSe5w3kVGHiqheDcyltzJ8Cn/+OgbOmVsW4sI8?=
 =?us-ascii?Q?snqvUBD4JQQ3LryJYYNqXuj/Pl7ykayX/f9ESArLB/6yIWzmXfulvu+025RW?=
 =?us-ascii?Q?LPiTKdpWe4mRCKvdMya+S7OMXxv8Db3wk/AWAsLsOMM56Mq8+3wIRoPr0LEW?=
 =?us-ascii?Q?JJ+pzBbQRv3G2oV69mPCGtokWDZHScfTEWRqkOAYSw2JZU0yFGm3ytIMn3dw?=
 =?us-ascii?Q?CLlKQ6x5hO0CU5z/OdpWA5i+EvYhIqen/ojQfvO+/KhgvNLC0rTrWJaWz3U8?=
 =?us-ascii?Q?lqxBfXB6cMZSgOicsQtU3aADqQf/Sn3ro0ohtBJhDyNfCdbKtSFfOvHJ71ZQ?=
 =?us-ascii?Q?nFurL7ftlbyiNqdRm6nIzgm7G44a8XXV2Z/q36nbb8owf+H1Sh4r8BQGG2Tm?=
 =?us-ascii?Q?RTR7Y0qTIsriBGjhSccbWkN3Syms2x2PiW7liRyfEHknjJaaX5A2JM2aIW0E?=
 =?us-ascii?Q?Eyny10HtBn9HPfADfSS6buGOnjoPt4Vd84BRJ7/68OiHkvxZLcqNaw+03iKV?=
 =?us-ascii?Q?PRqYoncCzLBHplffkJUfRCZWWjMOpFOxNmCOPEAmZy+Q9DRgA07bjEmHuvKK?=
 =?us-ascii?Q?8LapSmY/yhnQjUYp8oC0bdYRWFYBeBAmX464E0bjBZH4z18uhsQotgMsa8Wd?=
 =?us-ascii?Q?+GR4g1u/+65TDxuHPuulxNdmFU5PDtynoRiNLawKuzKwTUKI4S5FO+j48/bz?=
 =?us-ascii?Q?BF9NN6nwqYY6BP5oy++tA86byIOhFDMAVv2unC+Ddig46leyfOh2WuA7Iifu?=
 =?us-ascii?Q?lUycIvdhFWHY4qfqhuT0L0TQ04q7M35UHPzrp88BoMwCaxxWCdZuOlW4O+E4?=
 =?us-ascii?Q?qSjVQOHiElh9GRx0/gmVAjwSl78aSYmDi9j28IaG3LjDzcgPeC8rpoBrPdgj?=
 =?us-ascii?Q?UJJ+szEJwT5gdC6YjVdSkg9iA7Hyihm+IH396AbULgMtescMBU/1hmOBMNuB?=
 =?us-ascii?Q?fBjrGEPj9STi0m/IXiLPv5PHd2k9yu5dFqsjh/+Yc6BZ2A+pye9MwxcLjigr?=
 =?us-ascii?Q?78uaP/ChskDJakmpAoZY2q6euHftRUgnjINFLX//?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56270cd0-0380-47a7-7583-08ddb42726a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:30:40.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgmOLO14Ei+26VIOMI1F5j3Dx6644+EJuHnRMjCxbJmMFT3ebff2QX3+jzau2PrPs9eaYUGbvfezmTBlVWIT8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_133100_759092_4D5B3A2F 
X-CRM114-Status: GOOD (  23.54  )
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

On Wed, Jun 25, 2025 at 03:09:19PM +0200, Wolfram Sang wrote:
> This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> probably will get one. So, let's convert these error codes now, before
> it will be forgotten in the future, and they could slip through to
> applications.

I suggest the simple words should be enough.

i3c: core: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP

Replace non-standard ENOTSUPP with the SUSV4-defined error code EOPNOTSUPP
to fix below checkpatch warning:
  "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

Frank
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i3c/master.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e53c69d24873..354fef4a033c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -837,14 +837,14 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  		return -EINVAL;
>
>  	if (!master->ops->send_ccc_cmd)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
>  		return -EINVAL;
>
>  	if (master->ops->supports_ccc_cmd &&
>  	    !master->ops->supports_ccc_cmd(master, cmd))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = master->ops->send_ccc_cmd(master, cmd);
>  	if (ret) {
> @@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>
>  	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
>  		ret = i3c_master_gethdrcap_locked(master, &dev->info);
> -		if (ret && ret != -ENOTSUPP)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}
>
> @@ -2210,7 +2210,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	 */
>  	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
>  		dev_err(dev, "I2C device with 10 bit address not supported.");
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>  	}
>
>  	/* LVR is encoded in reg[2]. */
> @@ -2340,13 +2340,13 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  		return -EINVAL;
>
>  	if (!master->ops->i2c_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	/* Doing transfers to different devices is not supported. */
>  	addr = xfers[0].addr;
>  	for (i = 1; i < nxfers; i++) {
>  		if (addr != xfers[i].addr)
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  	}
>
>  	i3c_bus_normaluse_lock(&master->bus);
> @@ -2766,7 +2766,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>   *	    controller)
>   * @ops: the master controller operations
>   * @secondary: true if you are registering a secondary master. Will return
> - *	       -ENOTSUPP if set to true since secondary masters are not yet
> + *	       -EOPNOTSUPP if set to true since secondary masters are not yet
>   *	       supported
>   *
>   * This function takes care of everything for you:
> @@ -2793,7 +2793,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>
>  	/* We do not support secondary masters yet. */
>  	if (secondary)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
> @@ -2954,7 +2954,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  		return -EINVAL;
>
>  	if (!master->ops->priv_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	return master->ops->priv_xfers(dev, xfers, nxfers);
>  }
> @@ -3004,7 +3004,7 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  	int ret;
>
>  	if (!master->ops->request_ibi)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if (dev->ibi)
>  		return -EBUSY;
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
