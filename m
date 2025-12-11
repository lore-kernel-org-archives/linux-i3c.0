Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FACD41D5B
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BY2kvrkfcuCyhpYU6quET0zf0JMmlIIKQXgx+Q4hRwA=; b=nxqA1i7VZSc+BS
	TAgqg/GThrIkH/kO5vYujzrDsxfNiGLms5vPK9AUiIIx5xaKElX7uOH8Y4tBMrjKK4XYElAQObCjI
	625GqtEb7Vb/wbVXwc5P3uEqWY5A6MeDHynP6/QE/+tDTt8lquc3FIH7t61d6Lemij/e3D7Zkxk3q
	iVMrCf2sXKx7ak2LzLBCdgrOziNLiyBdllI2FkjWjvhPBh3s+EkUY8vlZkMtThfIq9RpIPkjnaOuD
	lDTBXOC2/sA+9G+5+nJbAxN2/Lzpg6ippQHjnRtKrJZaHB4h3huvCnCQq5QN9A3gmZnF8b1/lcS/4
	4q3jF/b1uhtjpFLrOKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTigk-0000000GmRz-3Mh0;
	Thu, 11 Dec 2025 15:34:42 +0000
Received: from mail-francecentralazon11013036.outbound.protection.outlook.com ([40.107.162.36] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTigh-0000000GmRM-23kA
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 15:34:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlNZZ5sHWwtWSQgzlpeF/JfMBpOsitEpb/uhfBBSYKg4UEosY16t+I7jgAGMm3+W58hJZ+0/AkiKL1/vp4tBWj8LzX6R0e4RDcCTvNtpzbgHhXoPI1x+gBT7h1ujgFrn1aaw1IO+ZLryAJ/ILRuuLHnc4kncD9bUBLGfU1Qk1OmEyz4sCeCHW8F0/eTF9gq4M372Br4JC5VOrR8Kapto4k8yC0F7t+xpE03m/EpepRsHnTzexEo+pIVZPRbX2Q6lJqDAuM9jiYYeBO//KsxkocFwnny/jLpVabdjZbKqkwgZpRC2ZNdWxuxZ1ydwU1LzqXmYQNpGCsaQHIupz1yElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHGGueadUeMS7Vf1aukOoL0lUGpqNoxKi9M7l0sICxU=;
 b=LyyQvP2u/hdRmOcBl5CBFtRwdWcrjQ4+rPstAzR+9/VixXm4og7gqIfvZutaz5ocBGxc9MMi13MgCW6G+1OW/dCQ7XcOPWxnYjkl0oIOmYjxzUfOOxk8f5J1lHipHHoCT1R06SAbQ2682g14HEL97214kIxLzP0+eHcJj59I31HLOXpwPnAXRyZlPsv01QgSUbJxXgBFLx30j2aMcP1Ass6VyFwiKkHeEuNCmooeHA7MAePv0H/wxrBCYvLTWpj7HSHd3t0WO3u2IXRFMj2cDW2EuFYbWomD5h4ToPwTmWjCCWA8I1Rhb/mYuMkDw4AzlMh9KP1IgI684GTf5S6Fng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHGGueadUeMS7Vf1aukOoL0lUGpqNoxKi9M7l0sICxU=;
 b=nvc0bZADFp9rJNt0Al8Af8a/tm/vDCiqJu2fcWTwcqK5JtZk3OhJRQx4CWFGOexNYpsRLbGshEhLXzC7rPak7HLi/Zxi4Zj65cGL1VbGOk/HbPWw3IXhbAF3Jfl1blWdUSqMUl849bw09cSfDvq/UB96jWGQt2g3GCnCXr1ndWw2k5KnkGus8j8QydGtB4tXou6aFKtBNT7+xNkLzi6fvy4Hx8uluNvebxtQK1+0S78VvltquujSQy36scson7HJUgvSG8FUVQj9+87L8vvER5b9Aa1DUZyJXEvvqdDydkdaJa7MEz7fAXrMvby7UfrqFfijPdmJ+tgNcAgq63RRvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 15:34:33 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 15:34:33 +0000
Date: Thu, 11 Dec 2025 10:34:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 05/10] i3c: mipi-i3c-hci-pci: Do not repeatedly check
 for NULL driver_data
Message-ID: <aTrkgao8ZJeFwCDe@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::16) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: be7effd9-588f-4caf-aa45-08de38cac87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZRX9J7MrpyPVPfxgG8xbUjZ2txpkg625NEvClQCPQsCOQQS8ojybZlwBTi9e?=
 =?us-ascii?Q?hFik4H8cA94acwJKOC3zqsGEsZIdtkNTIMrWs6xqBRPDZFsziGMbmUWJysji?=
 =?us-ascii?Q?PqEMJrx/Hwd4YPAyg+siJhB/RN0cy48ZKz5ZWCBEtqJFV/twiSdFMSZ5AuQV?=
 =?us-ascii?Q?gP9oy4IQiWleR8VVogLxPEb6Y12VYBxtwIXuN/EaOBtl6NsbgizEQAcke3iX?=
 =?us-ascii?Q?H6ONFSynoVgkUZgNHWn2jBf643muv6TJtNkPYOVEr+VNL7YcZbsXrMBpcCI8?=
 =?us-ascii?Q?ZrM/t5kLnOnjHqzLHddwmbLWugXvYjd8EzUOjs6kO76IoxF6muyNB+9EYcv4?=
 =?us-ascii?Q?0ikhNsNyvdL4HcSSTEMNpZ9XTEejaQjb30Sb9MFAf0Ei/t1Ujd+uavCpKOfc?=
 =?us-ascii?Q?D9LndZRL/9gX7qhGsX+JyBcb0RBk41AcFjYMrWwsx3GisfaAykZZns2jYEBC?=
 =?us-ascii?Q?HOLduh81gSwoy+cnSlcJDEReuF/5wOOPbGiG169GKdRWXD9dOyQTTTF+8ljR?=
 =?us-ascii?Q?nvP1fbbku47x7X59E5eZ7kfrjjyJiFMsl3aGhTRsmif3FTGVaUG2gR5zy3fs?=
 =?us-ascii?Q?jmzKC1wsh6V4CE+jZf0mm5ckNU1Q3iAgo3PkA7FQHj2+dYDexOneuXmo5xOR?=
 =?us-ascii?Q?K4jmytowpNIcxocQqWTW6qpQ7Kodvp2ol2ydtyLJUZVEbCeCrnapr2Xa4TGk?=
 =?us-ascii?Q?c0DxEXEjp1sBPhrMWpSYcme5Cb7M9N+n8Y7lv2IaJFEqux6AZ7djXthLTp3+?=
 =?us-ascii?Q?0aSv4EoELdX911FlH1V23Oh7EesB1c7MyXCpsgYEljbmQw8543sUGCBe5cA7?=
 =?us-ascii?Q?QUfLhb08J4NVps4rHv/xgx4MscNdtdDSOQpTIlYSVoJAf/awsODwFiBF8g6L?=
 =?us-ascii?Q?tuBNIY31uKUwLtwd0W/e+MlBGa29sGjikih+IWvhkJQUFkrjwqSNgAXKRcbw?=
 =?us-ascii?Q?P3ekTeM8xau8DMpGHZl2QNbUjxa8fRxYFauGAEIEjFPk5PCqztPpMzrMmlKe?=
 =?us-ascii?Q?ydzFRumiovrZNKLR18UeTep38SrpBwOf++JlwoqYOXB82xMLLY6DLpf4QQqf?=
 =?us-ascii?Q?hwUpQtKVYPoAjEChXvoWXXRrcGdWvnGtMX4nS0AzlR4jLMhvdlejUFdOckg8?=
 =?us-ascii?Q?gONdQ+teSXOcbbx/HXyxSr2v/3iFki0HrcunLiKSNRwMAhz9QRUK3YUDwJDc?=
 =?us-ascii?Q?sOzIs6esQyrJuWHOUcWlf+cojIfa9g6M2CZrUZFKyfebVSPXPZV9lrACmNTa?=
 =?us-ascii?Q?RNnQF4Ec9kgEZeBF2wYanQLZrurE5Wd7Cgzky3BRxCuf0rEJQiDC9ka+KXor?=
 =?us-ascii?Q?N5tpzxLSb/AZHvUz2HizI05kFelH+RzNsDbRKLgbfP38dPFo6sMGEK3h/BNC?=
 =?us-ascii?Q?hHyWHsY2mD/fcBXleAHsMt08aElcbRnSe/faBN+hAB5d8Wg9X0IEg/f5nR4f?=
 =?us-ascii?Q?dQLpL1hNk/RkSJJGlHhg/ELPYNUb21UfcV+w4RkbzuhuGFsgpL1GgGLaBs4o?=
 =?us-ascii?Q?vZyeQOXNP069cBvvbsZ83AC+ba0Cb0CmfTLP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?goLlowYh9UwNHDq1gQYR4B9oi6KpvDh2afYbRtOl24ZcKSxI/DqK0PwR0uMy?=
 =?us-ascii?Q?pTj5qHklUGrOfhuyxVhaE6Xpws0DGLaaV3/gm9JYW9eXONbRVwYlL/PW9hko?=
 =?us-ascii?Q?5/pUCtGt7RLKpdyPrEeRSB/qKubDSgRxnZIy6wc4q2a3Tjt4wl7GW0Mtrjo5?=
 =?us-ascii?Q?35zNYYmbY+ly9p9wqQ2Mlyd0THzg9nITiMhO0KxbHkqCJ4ltJAr497SpSV29?=
 =?us-ascii?Q?6EYUEeh2K3ig0GV+yMdz+2KXrMyI5FRihMO95jn+j5CJssj7FFw+v9sFneD5?=
 =?us-ascii?Q?DbtoFYoSRPNny8QWWYpJ5BOrPNOhOmovBVj47RSL87e9fDVoAWAGuotLuHXm?=
 =?us-ascii?Q?BWPwCFD0DUDzVxmrDBaxGaCaBsv7Fx0UVVtk4YmCOXzIAfPYbkSZhCngzcQ0?=
 =?us-ascii?Q?zjE2UkY88fvm+8OtJCnvE0tfdzggIe+NmQQKXOWVlYvP5FMqZBNJN2UCOaip?=
 =?us-ascii?Q?veUDbslsNrsjKWCBM6p+4XU7REN+177m9sHU0BXYEpzxgeWTWIr4oJhU0za8?=
 =?us-ascii?Q?F+xkKN+jpHImVPn6SDi9foqfhWOI0yIOF3pbxIIXVHZ2nBAY6k4uYBu2ROXJ?=
 =?us-ascii?Q?SvqicuV+rVcSJF0o05RXhBr+vLrh0eObGY2nc8GHtjNo4ZQbrWNIzz3OQx1N?=
 =?us-ascii?Q?/RXPztJK9Cxb22MMugs2t4d/2DFwpZw2w7033vtN7yKmLpsQWBdr8urCGE0R?=
 =?us-ascii?Q?qUvCljR+MdG52ToQ/2XU04pNU5rDUoUrgUMgykXSc7oRQ3bAeP0Hgp1P5juh?=
 =?us-ascii?Q?uhRXKA/bGczFguf5/FCVSlfvypbBmJ9V9Va1dghvA3hMFLvijBgjmNwz14oI?=
 =?us-ascii?Q?Q9+2lX/lDtDxTBV4PVXQ2FaU1rJD6+DTlZJZghSNJ2LfE0xBw9gbPWTnvlRL?=
 =?us-ascii?Q?zH/bO2jN9g/Mc04mC0OZgO65gQU+nR1hNZNH5YKcItm/caUkJp0D7az3KulS?=
 =?us-ascii?Q?3H7Er5ocW16zShUWNikYi0Lar/NKni5ckRtI/EfXxZ5NrNr78i47h5a0mRQn?=
 =?us-ascii?Q?VmLL8sBgNUmcwHLOAFuYA1MR0xZ7mXgNvGlFdQ+J+6kTEnDDQQEAyHJBLkMb?=
 =?us-ascii?Q?rVXhy0L9uWEbSkPkdqdmkGIXmsWAKu5NpvXxBphsSQATcibAJ7MJOM2IYZNj?=
 =?us-ascii?Q?7XljegRAUgdkoG1ky+gKxrOJpjG2HyiDJDXj1IQGPF7pyqN8Z1rvSDbx92cE?=
 =?us-ascii?Q?e8z0X75hSWg5XtmZztiEok54nWQ/kOHvTXcUIsjCCxcJvVcqRBniGHnk3bDA?=
 =?us-ascii?Q?21FrNyV/muYZJANntB+6T2ygpSQpBj/Om+yB9FMcb9/DDaK0bTGz0uPVD/ZD?=
 =?us-ascii?Q?ooSvAqeITjFPSl+oziic3An3mMv3V6R38aLw/1cmwUMa1i8jkIMjSavJTug5?=
 =?us-ascii?Q?CnouicaiRqoSoSgaKuSlxFrbqtz9KeNp0T/xyUrh+CcXFk+mxElw2i4IetmV?=
 =?us-ascii?Q?lPc4KVPLfpRkuMG7qSsSijHnkNmbyfnoenJXbMqeLrVjHQ+MVbX2q58fg8nJ?=
 =?us-ascii?Q?AGjF13zbhdADhSFF63IT2YPBe+UPhqoubgPKWqgmZbKyfXyWCjcV+H41Xlzj?=
 =?us-ascii?Q?7UXhffVEac4AnWXBE3DVeGMHq2PRAbviT0R5OFOU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7effd9-588f-4caf-aa45-08de38cac87d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:34:33.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4KxG0vGfYQV/V/6kgIdI2eRqiW8opKjH05PJ4r6t453dGKeC55dD2f7AtVbabSxTh6JnrxFXnqNIY+GO3O5Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_073439_551482_6697D3D2 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Dec 11, 2025 at 03:48:04PM +0200, Adrian Hunter wrote:
> All entries in the id_table have driver_data. Do not repeatedly check for
> NULL driver_data.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Drop default driver data
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index dc8ede0f8ad8..8ade911e3835 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -229,7 +229,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  		goto err;
>
>  	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> -	if (hci->info && hci->info->init) {
> +	if (hci->info->init) {
>  		ret = hci->info->init(hci);
>  		if (ret)
>  			goto err;
> @@ -244,7 +244,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	return 0;
>
>  err_exit:
> -	if (hci->info && hci->info->exit)
> +	if (hci->info->exit)
>  		hci->info->exit(hci);
>  err:
>  	platform_device_put(hci->pdev);
> @@ -258,7 +258,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	struct platform_device *pdev = hci->pdev;
>  	int dev_id = pdev->id;
>
> -	if (hci->info && hci->info->exit)
> +	if (hci->info->exit)
>  		hci->info->exit(hci);
>
>  	platform_device_unregister(pdev);
> --
> 2.51.0
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
