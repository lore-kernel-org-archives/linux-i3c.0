Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA22C5DF66
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+3XNJPTQ4IypJ4oEXYiJqoZZHKhAIE0zKh9w6sVay0=; b=HM+gi73cKX0XT6
	okAYBnp2GPlVO3EasXeVsXi+5slf6J1m6NO0atKhrMgA6UQTa6Me4wisEGdPcMB4DTkBgZK8FaAqy
	+R2d71hGxBCLw9QMAikiO1+ggvKQC7b9ZM/DAbTGtj4VeH3codE175FbuxH5izqYvZlG6+98iQSx/
	+WBSy1pvBAkbKdBexWMZKBbxNp/r3BkRyv+1oucXe33/zTPF3cDRAZzFrKt8S2ffOKUGy4Zy5MMOo
	aqaZ7TWabIK2L8hE7mlBwXNt++b5X9+hBUCiejeYfvr7YdtmlkLGRNCjlvHpzqzmMyzkMJxbX0T1P
	xL44LAR0HU3fhlv5JLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3MJ-00000006kUs-143W;
	Mon, 17 Aug 2026 19:50:59 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3MG-00000006kUV-1kND
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 19:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwTBhEsrWexMvkr61DqeUDzkWSEpFxngJ1kZCUwUWC1kmvJlp08CBddcAdRWnPCuQ4/v41br9arWaIwfEwfAt9Y1dRXaaRkuPOQPIBUYkDsdx6BaGVKkiwfkiuTBamQ8UY1oqH9deEPG+Gspc2tbEetWAc7ZxXwWo9Vt34XfJkP+p2j6PV9JbronVgaR18j3C5ysesA/2/4l0VrB/OUOPYQgGTpzt5RbJJgfUVgKtoK6ffDIF/uizvKvfcmHlo/vE9rABj7Iw5YIaaiCfcoaFM7Ks7XGZcpxYV0ePEg5acmyaB6bgNdMSMg/k16Y0qNxerRiy7Zwm/NiPoExgURp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBZv//2nlRNlGaWhYlgMyEbsxsR3beywtDg15dNpbtI=;
 b=kRMbnXFmcKICNHZbizXHQv3B6/aq4UJtHMj922vluSk+YGTQXB0vxyy4icHBFeLlZ8A2cgkNYigGksIBK5T22HVxN1K+y241Zcl74OLP1BTfttfbo2ZoVK3VGNPqye7rt6ddgtAwaYV72fF/zlhiksKvOL334/07ayMJXEKDQtFw+/yFVnlqPUNqKzf8ejb3O8cfp3n6e9i9pT2aaxbqFcsS4Nwuw6b+fEsOqQofjsmTvXzTdQ09Iw8sKURxUQav/hnKVXuHlk9MnftFNJ47bcVC/Bqmjsgmyyg6D/yKC3bzZXG+aczvdofdE1j4QzijRJtcCB8KfxzltyrZMKx/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBZv//2nlRNlGaWhYlgMyEbsxsR3beywtDg15dNpbtI=;
 b=IUS8CNb2uVS8BtziJ4FFtpTxOV7B5y53fOpjgdQS4ChVd/1ZNlg5Brl7cj6IQu+XmaKCDHCvsV0H8lPPzkSfvxogDPShFK/3J9Mw5dtxyLgKwYkCPXW0GcfnUvh/pEDTXlUpej0Em3DYIxqBDEROgSBF15EkEsxbTsCPooGVJIb9wH580KI0nzGaR71UP6uGXWobhOjo7dSa15njvdj15N0MhlBM+7yvuZ6/cXiOXVJRMMRjGwfDgV9//r1+kB9A4SnN9UEaYF5gPF0pMx51OY2zOTxXuf6CBYRCo6Y5nk2iLiMLjywzDvu+7uqYWInxB9XU923CswhMgbz1P5OWag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:50:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 19:50:52 +0000
Date: Mon, 17 Aug 2026 15:50:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <tim678910@gmail.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com, linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw, Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw
Subject: Re: [PATCH v3 2/3] i3c: mipi-i3c-hci: Add PIO queue management
 support for HCI v1.2
Message-ID: <aoNmFLgWymQeZHn-@lizhi-Precision-Tower-5810>
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
 <20260817082647.612471-3-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260817082647.612471-3-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: PH8PR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:510:2da::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 61eed61d-371d-4ac8-d8e2-08defc98d7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|56012099006|10067099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: D0QLx+BSStauEjVaIASMxB1LsoDPSyoofRov7nsKpAkuDF/D1KDHCHIrDiPwH8qO1HppaFvxCJT1yAI8KYX8QFQntc/ZxFiEpn3FHtlgnonHfFDdBll5bBOb+E5OnJ9llMfPTQa1MqU3DwkiJoh4BBra1Q0Z2yz1kNvtaQFQDMVgAqGiZ+VPBbqRXoJXiTJm1RPO6jizMz1yjtqR8Ev9tSCsVtQtpE/Sk6T6sWRztaVibz+6JmUgyxLp0Zn/IeIcatIeV9QSF0qIJ+wOUicXB6dd1/6SZWcFZW+w510hWvhtfdW2kg7eLxjDfAyXFlSHR7xp9slLCouUhnDimV2JpHEpz4nHF93FV6srQweV/pGHtM/18Mmx9iZfoC138zlRxSVjMbiEMlDDkvx3x34gtcfJMpUmhY+tHTyw9s1KnJkP6+qqvuPgZCtJxzbBC6yvWD4PrDQb0yx7RC/x39PYnP3VR7qrfcUeRbdGGxOd6+GQXlQayyyYqxlN+wgOD5M2b+KkbvCOOcYs+prFpLsvMGUAP6aCwAo6jQQrlApRHFxnWRxfIoprrYrFUIA5USjTlQlfC1R/DEgvsXrg5rntba+Ui6b3Ear59VB+EcT6VXAT+jQp8lfwymvaUoAVWaR8iP05XKVTdQCAsmmC/sjX/LO8F/dOn2hNFes5hHoABew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrzqydxvG1cETo2C/pyPWtWZ1qkWpkO6OXb418Cy72k8171iSaQVrHQjFH9k?=
 =?us-ascii?Q?gU/zdy1Zbis6o+gKRWj2Aj1wP/4jjIoJZOARctXI86jD/dX4WJT+piqOM203?=
 =?us-ascii?Q?NHZPIXhRhmvu4rPb3GO/vlsnB2pUzZMxAFcAPCLBfDHFwO3BaDWB6rnxqpSy?=
 =?us-ascii?Q?aZsd4Wy4mdJfK7vUtQe4NcdXi+UmXJidvlWp3wtdSCTIxl98fQ59rDCi8Mzk?=
 =?us-ascii?Q?rhg9OwyIk4XW5PISWr103N2tO1IQOcXxO3xHJlqLdBLbx0iDH501ruiCbg4K?=
 =?us-ascii?Q?fpWqdBNCsd4/fuM2pp88yF5CqbcVzvXbKIjuJtelRHNf+1PeLFbil1ckFZEc?=
 =?us-ascii?Q?SHxUSoL0MUbuMC9MW9oeUHUFbgBjUZ/OuXonwwdVfXIQEUmUZR/VrqZ7yYSE?=
 =?us-ascii?Q?i5BMifqb/JKRAXT1bWNAoDTnuRrecaY6dLRZ/EBRAJWCQGzlKaSVoCj1mFEI?=
 =?us-ascii?Q?BtPjKYJYO5iQyEtt9nhcur4jc/PipyVakxAve2kK34NgZ0KVk2AMTCoCrAsc?=
 =?us-ascii?Q?zvHtZGJ7s3O/IfQ5aQJW28d80XKEAH1uBsaaupBfJGzeIY8kiG7WMtDGQSIi?=
 =?us-ascii?Q?fD+7wKyfWdKf6N+OnVK68ZC/vSlosMN/c9RauOGD96Vr5efW65/RzA+OGVfK?=
 =?us-ascii?Q?xCRIcEY1/2RwIXyJ/QTMzjVNfXXb5mew+OOFx+IHxjumLWw7U/mJa8hhUSnH?=
 =?us-ascii?Q?XLhTG2/QpYNyqAi24pAkVAji2H8Bbxudj2/tVb19YZTFNBTmn8+xqRoMYNXj?=
 =?us-ascii?Q?dYeKjfh/zcaaS3938fyHAk98ysgMs4Iyl88a6rDZqxedEg0AifMqIviO2Iq3?=
 =?us-ascii?Q?TSGJ2bbr5BmG3C+0UdnFdjO+IJqC2nI9zcozDwVLAClSNW8TEgOkHgCvVmM5?=
 =?us-ascii?Q?B1XfwZuJhKgKVGHXARJAQj5OHCEDI1cx3H6iCqNsaimQK2YpAC+bBjGSTyIH?=
 =?us-ascii?Q?4lF44vgkljKdivAf/S/bV4AtjUm1IJwIwV0/WJqpiH9vX+cOo8RMcae2CnCd?=
 =?us-ascii?Q?3hg2+CHeSzNNxmAB4MdazgAY2FuFkRbbxHwd3srPlu2Lz8Ukog/Uzg0xlz8+?=
 =?us-ascii?Q?l0eNljYRLygSdbqRCL5tsggCGOzNT1H1jnj2Ra6lsL2M988An53ykx4UvONf?=
 =?us-ascii?Q?5D6c4FEDU2nhROlCVB18L4pPTpFjL4fU6zV3SjLq9bFEToUEpbv3wnxt64ny?=
 =?us-ascii?Q?xrNTzR/mcCHqYXsSqAEtFGbBM1uBpcKqPAHeeQRrfOTeLAcDf+cBNMPSyvGR?=
 =?us-ascii?Q?G0VQ/stGylxf0aVumtnOq2sff43DEg3EreEyuEZZaIR+JAc0E2hFlRvBxMKs?=
 =?us-ascii?Q?3UkJGZT7CVm4q0uQrdqekFtogA/e8xU+WiZt6AMA/w9EkUks9PbgtPrVR3Ov?=
 =?us-ascii?Q?FshzDCNiC46EXrUiyhsHQCXHwLySAtryXb+oxGoO9uG74PaFNnZvKupiTdRD?=
 =?us-ascii?Q?rK5eaXDrzlgl07jOCoYtlV5VAAWwXuiTHm+5dWivupa2n/L3rjXLLuV70yi0?=
 =?us-ascii?Q?k/7XS6seybH6PLxqL1HFh2LELYjz1HVsBId65q+Gm2ySt8L47KqNVZ9/Y/Gv?=
 =?us-ascii?Q?A+gP2AeyP7wWsj1Il/iNnpG1sqIYmVgWMCPAM5nBwzuVdwyaSXcDS/e9pvpa?=
 =?us-ascii?Q?SZbeGDxtqfKQ/tzV41UxKBg38KBjb7IGos+9HsivlAVyfeqrbhRn8jE8Fc7j?=
 =?us-ascii?Q?BjkH9qRFs9Y2qCuSpDH/pvvAh/b6TGk3LIn8CWCjGQ+5TvvgR5WfGQ31J+9d?=
 =?us-ascii?Q?eNlvAr0GSSEZOPoTjTlEW4iY0APh/wlaOtjaasPpRVVnSnFfK7CO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61eed61d-371d-4ac8-d8e2-08defc98d7ca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:50:52.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQMcU7g79GYt6jILBwsV3E9NXSWyhepntO0RjgO8YOxpPJvPkCn53oysecSIuVMTnbWwjruqU9SswzkXkpK/OVSov7CcEpN9WJZJQKKKFemASqhccQS3uuR73CjIJSLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_125056_632961_B8B6590A 
X-CRM114-Status: GOOD (  22.12  )
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

On Mon, Aug 17, 2026 at 04:26:46PM +0800, Jian-Ming Liao wrote:
> Support explicit enablement and starting of PIO queues as required by
> HCI v1.2.
> Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
> Implement explicit PIO queue stopping/disabling and restart logic after
> errors.
>
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---
> v3:
>  - No functional code changes.
>  - Aligned From: and Signed-off-by: email addresses (Adrian).

Still match Jian-Ming Liao <tim678910@gmail.com>,
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

Frank
> v2:
>  - Removed '-' prefixes from commit message (Frank).
>  - Aligned GENMASK bit definitions with existing macro styles (Frank).
>  - Reverted unnecessary dev_dbg line movements (Frank).
>  - Removed manual kfree(pio) as pio is devm managed (Frank).
>  - Introduced helper macro for HCI version checks (Frank).
>
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  5 ++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 67 ++++++++++++++++++++++++--
>  3 files changed, 69 insertions(+), 4 deletions(-)
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
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index b3d9803b1968..becccb1a8cf5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -30,6 +30,11 @@
>  #define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
>  #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>
> +/* helper macro for HCI version check */
> +#define hci_version_at_least(hci, maj, min) \
> +	((hci)->version_major > (maj) || \
> +	((hci)->version_major == (maj) && (hci)->version_minor >= (min)))
> +
>  struct hci_cmd_ops;
>
>  struct dat_words {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index a1341d66bc65..439578a6eb54 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -45,6 +45,11 @@
>  #define IBI_STATUS_SIZE			GENMASK(15, 8)
>  #define CR_QUEUE_SIZE			GENMASK(7, 0)
>
> +#define PIO_ALT_QUEUE_SIZE		0x1C
> +#define EXT_IBI_QUEUE_EN		BIT(28)
> +#define ALT_RESP_QUEUE_EN		BIT(24)
> +#define ALT_RESP_QUEUE_SIZE		GENMASK(7, 0)
> +
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
> @@ -173,6 +183,14 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * IBI queue size within allowed bounds.
>  	 */
>  	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +	/* Adjust actual IBI queue size based on v1.2 ALT_QUEUE_SIZE */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
>  	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
>  	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
>  	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
> @@ -190,6 +208,17 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * (will be activated on first xfer).
>  	 */
>  	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
>  }
>
>  static void hci_pio_suspend(struct i3c_hci *hci)
> @@ -208,6 +237,7 @@ static int hci_pio_init(struct i3c_hci *hci)
>  {
>  	struct hci_pio_data *pio;
>  	u32 size_val;
> +	u32 cmd_sz, resp_sz, ibi_val;
>
>  	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
>  	if (!pio)
> @@ -217,10 +247,24 @@ static int hci_pio_init(struct i3c_hci *hci)
>
>  	__hci_pio_init(hci, &size_val);
>
> -	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> -		FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> -		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> +	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
> +	resp_sz = cmd_sz;
> +	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +
> +	/* MIPI I3C HCI v1.2 supports alternate RESP/IBI queue size */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & ALT_RESP_QUEUE_EN)
> +			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
> +	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
> +		cmd_sz, resp_sz);
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n",
> +		4 * ibi_val);
>  	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
>  		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
>  	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> @@ -244,6 +288,9 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  		BUG_ON(pio->curr_rx);
>  		BUG_ON(pio->curr_tx);
>  		BUG_ON(pio->curr_resp);
> +		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
> +		if (hci_version_at_least(hci, 1, 2))
> +			pio_reg_write(CONTROL, 0x0);
>  	}
>  }
>
> @@ -764,6 +811,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
>  		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
>  	/* then reset the hardware */
>  	mipi_i3c_hci_pio_reset(hci);
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
> +	if (hci_version_at_least(hci, 1, 2)) {
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
