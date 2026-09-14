Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7007C88E72
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VyFwpPKZWGrWvlw6ukoGl0duB+7kczmX8nKx6wJEK4=; b=ois8UYXuC0/H5A
	bO1Ccc/A71SXnB/n3ywwlXcWYjK4ioqhgH/2eSoBTWm/YY8FmsbC0OxdTZNbIjuVDfZwHfCevC3HF
	TVbfUjB8B4Ld9gpc+VUb3VzDM1RkRPmQh8EykcgS6Fe0oH2WYyRSEdLcrQ1V0j1+u90R466B7ij5D
	DGJJwZT0KNQ22/a2j5y/9dH9YyzcZas9auMBf5AJid6Ry9fre6qrb1Vgk6s37wlmD4mA2W/KLXKBe
	IoFDIOfzwpocz3gmx9CAps2BQ8y1/9G6Z/nJg3talNLRtaDKChbVsFCwA511b2EdYhTNMH7Q0RVid
	Fp0s402rgDo6Gm3or+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69Mx-00000004Gom-2kMQ;
	Mon, 14 Sep 2026 16:17:23 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69Mv-00000004GoF-2eEt
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 16:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncqTXPiynsymOoWwo0UBlSY0EyohrDCtalrJqjhpNWBus9+WKqkU1kaTS8H+ZmeLmxfvkqnEkrETop7lWFkuc2Eo/Vb5Hqo8Dq6Pq/HDaya75IDQEilFrUCwsUx65grJ/8NSR4c6lYP+BePweggWkRI0MdS7zz23+IW/SPnhRL8p0nQDFRuvpsK7q6sziAT11Z6LzliNan24F7ZYKfCfmuLJzETmcNNN70lHsZu2fsYITii+Dup8JZhCNeiJXuRTdeTfK7L93zWqggDHdMli5AepimE+PHzkdbFvJLdTbpde7sJKxvZ4Bwqjriuwv2bu+bWW3lzkH8Y/B9+ZlLnBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QD/exMfzsMM4/xvPxV8DH3uBPavrilQ9cq6Dnx7Pt4=;
 b=Y8xMZvig3RsSW5ptjrvq4cMgnhKMES8XWKs7mf6ijIgqG/m5ud9zMmz5H/oE0jlG8juXh5FXbPrXQMom23AW7Rzv+VcBJaOZ0QOo0qL2lGsJEua8LXxkaqyLNKrwFeLEDv7UqUd0ApvXd7JH3wEusKRh7xCgUwlo+AwSdAAu6aWzh+yRZ28LW33R66Eu9rnS1pYjkB5ZuQWOGyjOCPt3iJkAPw8e81FjcnhbEi+vQOdAmpK6m0+W7Q/ZjBJ1WJ1xILM2xGjvPkgwp02hFrZBk3n4DucNE59YBpWfzjYFwXJQDXNxygnBnyRqKfTkITJQAc/p8PfozTfX30Mj9yMojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QD/exMfzsMM4/xvPxV8DH3uBPavrilQ9cq6Dnx7Pt4=;
 b=ucasy8vSvHMi+4CN3HIRNLFDJHULsCADra2zI3pCdqic2LnYCHcxtKVzM7ln+ed/q8wtTFtzup9o1zRdMhFiXNdSwPII5A3qE7iidpJXeOnITX30w+kGf1HYvzHtyGgzBZwvg9siYOuObC7nv5PZY4atOC+4U8teWihwchm8cHV8leLpiBmmmJ+sbscZsAwywM1Vcdgb8hdyoo0guPr2eT0FCWIuw/2UxFsSbVTjl74OcCsDHAzhSuOQatTokbblzKoFM1NeQipgiaIR3ev+WFiJ84jEbtdwsPD2HQQCfhdUlO2K39SMUJSVfOiQkBmZATDYnKw6TG88FPRD9URbHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8425.eurprd04.prod.outlook.com (2603:10a6:102:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:17:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:17:15 +0000
Date: Mon, 14 Sep 2026 12:17:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating
 LTR sysfs attribute
Message-ID: <aqgeBHJTmGrro8zV@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: d144fbc9-b249-4a71-6aeb-08df127ba408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|11063799006|5023799004|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wN664Mlx7tNn1MvE+CV+PYDZPk08o2hm608VaWND1YfFdVz1WV2D31fZvSMdThQLSj5zYJMiFP9GIqX3ShVml1P1omuDyMbqOrQIsofyYc2OkWUJfhgK1pL6JPEy0c+0N8uVx/KWVcvQQ9xBor2yuk0NNFdwaau3BqUrP8IxTYQbKg5HK4yJv/YJY2BJdGuEncaHWrDZ+g6dkiTxx8GYdWM5vJk5LRjeSaGLQhvKkD3JYd1rWeDRPty1KgTinrj+vIV0a+k1zlfBdXQg7yWskvN3cky4YCgGhqHkazZRJIo4MPIAIHOjlPcdonyeV0PqlpR7/+o4EfkrJEPErTfGC/e5BD2CUODwr28aW3kWVC9HauJ5tAMlll2+zDRqpQgUjUdIEFyBNzzSbnd3dW/Py77vFpSTzk6KGwLHJwiW+muDnZb1PZgjXxZ5KFeFyXiP0jiV803ynWSs4z6nVUvUxvPxmsD5JLILuLVJ37b61B3u8KJMyXdEa+IL2UOS58wrza976tlqJpDhCk1t9WyuF6eRfJGToozwF75p6QBv/q+pO+IYclgEVdtnkpRf3+hDzd3nbvToMkfB2O82xXRpBMsTnpRdLbjhwag4r0bwJY6gSUvrhyhjeivBC/jfU9iI3dXZNQ7kUAdv2NwR4A4K1CUwP+8itWy03AmvZv0pA2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u69aqp8CGVgp6fpzE84qd0aRX8O81UfNeI/aeshHC8rvjBR3WU5kqb2ZzEmv?=
 =?us-ascii?Q?glpJjjmEXwDTVlT290op/9uHgvTEb4T74HWCjgB0ay8QuZkTJiQoQkO2xEei?=
 =?us-ascii?Q?oFTTvksj9SWFi3yi/YvddQMBGcTucEaZCOFME8WbjB+wnPnECGNPhLgHm7Uj?=
 =?us-ascii?Q?AQAxZZskMfe0fHd7Y+sPyLjMJUbBhMtjaBjuJMlZ8H7V6WxOEsr32dkTfj+h?=
 =?us-ascii?Q?ir5X4JQfqFs6jue9+MREGOsucabGwCKA8Gy4IX+LlefYCFduBdwKwWtdG2Uc?=
 =?us-ascii?Q?6/C1oHQXgF4J0T3WBX+BhFomoUPJEG1mp/LAv5D2EjFv39pb+NWHlOVPoX/F?=
 =?us-ascii?Q?1fKJH5yxd6MByUJImbhO1iliRazTTndIriXjOQDYWjYqhrm0TYdfasS4j1Ts?=
 =?us-ascii?Q?wVPtcUke7SegXPVVfnEllefVFBCO23HAKui71GI2WSAGEDgCxAvBRJ4qTyQV?=
 =?us-ascii?Q?SjG0hf6I36vviyYkBNlS87WFr77IeaYGhtqEs4fUOvXoC8B6asoJ3rC9AmPE?=
 =?us-ascii?Q?fNuX80uHb+QnoYqiZ/uvCeiVSBqKuzXNa9e6zAROcRT7qRcMSTrv1ndUctAI?=
 =?us-ascii?Q?aURtUyitrU20kaEuMPmSTYCmVxzPrxjZOQyJMVY/ZSLCmd2VvihSp57X8V5T?=
 =?us-ascii?Q?wtmi62fiumpBXQlWYgly9iohvcJMISgjJ8OCJARGdaSv99vt4CwIQSm71TCR?=
 =?us-ascii?Q?s9g0FQuUceBv7TSsJOS3K2pkTQAxxu2534pOx0Hc8qxQqFItzmczY2a0AfIr?=
 =?us-ascii?Q?xZRz0MTSncdkidLNL7XTOIQk2+Llm4IwLszgLzQjDM7NggBzA5q0TbppLRRO?=
 =?us-ascii?Q?SEbvRpDnBWeR5x/Gz5367K1ffkrOjy3Vivd53f7NFwBc48jMggeZw6nVl6a5?=
 =?us-ascii?Q?0Ej6W0bFTJntE46S1nTqUJvoBN5gCiGby0qz1MG2u9Ha3hkRQPvZtulJJAoS?=
 =?us-ascii?Q?ysAFprXGSEPjiM5L5kGhEerioprxss3tfnT1F8bV9jjSW3gSN9oeA9GZy3O3?=
 =?us-ascii?Q?fW6aX9JaiZRPj4SrevB8bK+AHPXMsNslA9V0wp3igLSgbQbFubxkCm8Tm8br?=
 =?us-ascii?Q?ldxzje9lkGYcO+58mueL4Ymxnwf7dmg4FifSub5twOiphUqVjRh7dAD1UfDp?=
 =?us-ascii?Q?dOwh/CVCTvRixAiPEWodEsa1nu8lMCScMEfaqg98LheD4gbIPXYfUsbtrUiX?=
 =?us-ascii?Q?OCK8fQUhnK2V83RziNLWgfgr/cGUo0R2UQI+zR2J+iSGQ89PpBUqr2hiLaqm?=
 =?us-ascii?Q?f6jY5s7W3xL3s50t1yXHtdcbmiHAWMM8Cvq/3o2QJbF38BngjrCFESxsM/97?=
 =?us-ascii?Q?tmkehObkzSxMk2P2IeDsZ5fMDexQHDObve47ajgSisshTAlnsteSDPK8wQl1?=
 =?us-ascii?Q?MycYdRBOnx2ABCVtZ1K/K6wfdYrEH0S80bizAG1pOuEziOx+9c5QiEVfB8Gk?=
 =?us-ascii?Q?0WtEo1ZW5Rs0MHcPGKNYj5w4pojWyLOFoJBUi3WT5qpFXI/0Dqcx8VontPZs?=
 =?us-ascii?Q?mGFVaHaql1yKdf7kDQtjxxMBsLDfeIXpDzRRgz7tu00Ejt7xZbncxRDJEfVZ?=
 =?us-ascii?Q?WmutVQ6PlrRBuYW/yh6kjJ5YUXR67EImenMUCy/yYFl0oz1TwRMYJE+SFSqc?=
 =?us-ascii?Q?RI8wK9LSvrzvChuFc0khQWBCfCl6VFiaOXKhzplOGkN6ysQF8xqQCsI11hIi?=
 =?us-ascii?Q?WP8LZQmrpL3022sFrpqMVrt3w7UH8zHINAtk1NrhLzrfK5QBM2wnJOnWbUti?=
 =?us-ascii?Q?W0Sxd8q8CbEYCggesgDvbF1Vr/t/n0rjTiom9I7sELZzI2SBZaBy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d144fbc9-b249-4a71-6aeb-08df127ba408
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:17:15.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlEZ2fM2f6z3h/hlD+GFE0876nFlLS03kq3hhwUmJoheWsMO2MfnCkaSIqYHTiLuzkWJskmHvK71FfJnPYw03pFqCpktNFhvJyw91RAqV4Qx2TA0KfEiVpeVRXlDaPcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_091721_675378_34961073 
X-CRM114-Status: GOOD (  16.40  )
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

On Mon, Sep 14, 2026 at 02:29:49PM +0300, Adrian Hunter wrote:
> intel_i3c_init() creates the pm_qos_latency_tolerance_us sysfs attribute
> before probe calls pci_set_drvdata().  A userspace write to the attribute
> can therefore invoke intel_ltr_set(), which uses pci_get_drvdata(),
> before drvdata has been initialized.
>
> Move pci_set_drvdata() before hci->info->init() so drvdata is available
> before the sysfs attribute becomes accessible.
>
> Fixes: 884a33131f2a ("i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index ab595661db1e..af9595009b03 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -445,6 +445,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret < 0)
>  		return ret;
>
> +	pci_set_drvdata(pci, hci);
> +
>  	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>
>  	ret = hci->info->init ? hci->info->init(hci) : 0;
> @@ -455,8 +457,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto err_exit;
>
> -	pci_set_drvdata(pci, hci);
> -
>  	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
>
>  	return 0;
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
