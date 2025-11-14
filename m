Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35939CEACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIpHDAAlRT1yrg8IHPTjHrVnZinXn2TyXtXqAj04HZY=; b=Loqx/vk/HVvFPB
	QD1GBTWOJVH6MlXtXLMQlj2mm5uhwEtVv50csxyTR/iwnt85qfkV8ddFgAtCZLSW7vwZfpwIaJFSn
	uVIeDkDFL9jrpGwrKWVY7vBL9Du3Ai5NXm7c3rwDKi2PCrr7Q/WyfidiNx/sFfjND55TEb6HGN0ke
	qTAlesUJZ3Dv8JC6D6YQ4IzBsuEZSYsemeZIXu4f/H4y8J9yyTGhWvsoE3WxZA/fsLj3O+0F95Eck
	wv55tFLA4tzL+kZFjCkiRHNG0yuHLcYaulhkZ1gBs7EjJXvF516IsT5ywbRtPZJ4V1FSSvO0w7i9u
	RIWnTVrNUY9mKVmnqIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzjA-0000000D2A1-3pzF;
	Fri, 14 Nov 2025 19:45:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzj9-0000000D29F-13zn
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEl7zOZZB6BlaNFgqibWeAo9GF/77/WlJufxUocLfXQLMVMJEkRjH4tJOyF1gy0A0Wr6rxRzR90ke2TyHVP/IIpbSTN1o+foXbVGILQtR7ybdUDnH8ysbcVZTSVAZ7pzB0JbqI6jJBsUvrvF27U1gjUe2Ab3Msma6LhyRGgjd1YzOnofgjVQRHKFC+YkLKp0BMkjpy3orJyfZGRcHIb15dKb2Xc+gONjyltDqNzuvX+Lwu7dt3u2Mp9L0Gy65s/dS6BSttoZPUqyzsl8/BNh4yzo+EC1dEsV9I5bP0z0zkuddu/0n9JmiO/JWzqz+nE7ob6IzNdMaghICVI7totGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqlLDJawnTxfm3/Ivcft5jwYC+Hp5MtE8XWD02FdPn8=;
 b=SU8GjUvwZIBqTSLwqgPu7ATHq13sQJ1LbTptMz//5WITenoyoF/iNZWPneqO19LiKDC85SVpl2+hUe67Zg4hcz1T/MX7i1Qs/JBNNYvXBOYR11EJQqYf7IGW8t0LRY5UZ2j/YI+pGJyRET6vHmtWS7RvV1a6qbU1MZaK+9SR2qcNI6MJ7kqcMZAgX1GzG7HbY8Hsbi9xzu5xz+hpfOUD/Jo9s1vi94giEl8kG7N02TYNo8KPtSs43iLScSPcRSsBkkUk51Cg5EwJBxGzeEs8zX1fYHtL1Qy79lIRu1Jb9ms2gG4VGTdF5RifvsByZKEJnNhrBdE/ImNB3MtZ4LPGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqlLDJawnTxfm3/Ivcft5jwYC+Hp5MtE8XWD02FdPn8=;
 b=dE2B13PWvw8I7OfdiTa+cq9VmeKlHW5gBIf6DyMkaqZN4NdyUkKBjSlnDxqVYzDHcyLU4FI7RrVIZvj7a1ax/o06JJMuWLmA2crmDcv5klSPohiSAc4GfOBIrr5g+idb5CqepOM76N4tNKad1z3YarCBSPBbKRFTQ86LsnGJAvNVvNgb7DdnAaoPGb8CvC/NMnsR04f3wC4Ak5M6npMgXp6xCxTnN9jLiA41SpHnDaRX4T/tukECDu1Rwx5eUuDSUBzHY84lG5+Npw2GSBHQCnbWEB2eL410UuhyARypPshMVce3ZPErl5mgEC3CVCwWzKHc8s/7y2fV3ERU5+nL0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 19:44:56 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:44:56 +0000
Date: Fri, 14 Nov 2025 14:44:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Message-ID: <aReGs8Z/5t7wY7xC@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:806:127::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 1305bfae-8786-49a3-8d28-08de23b649d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LZE1mRih2/BH99HDP9LVRHIr1frbDH+wb0B3dqnt3Ez5Mih139087nbqbLLt?=
 =?us-ascii?Q?skinQMW5Qe+n7CTM0jyKrWIev0wfkbxr0NuAHo9++LPTo6ooOMIv4KrcPeqA?=
 =?us-ascii?Q?6esREOnmiiVab/Krf1ez0+6nxr+nsCAyKC1EJ4rifJ+DA+Zdgd0YHSEd9QQ2?=
 =?us-ascii?Q?zpwLRd+W0mPlvl4xozMe8bIplcFrUSdyDu0l6kpf6OSkpA2N7OartMNtE0dF?=
 =?us-ascii?Q?raYqMA9ShBn5kOPHFrvSltQliK8ujBQYbnL3DKp8DSfX7NoVfmvJM0OerzfV?=
 =?us-ascii?Q?oL0qy+5+5+8wrpRv0i3t4rzptKywT7XFqO9MQy59tWZ7XIPOAX+n44GY9JJJ?=
 =?us-ascii?Q?pEE2KPRtrGVKztp2Y/LAlOoUi3+N1UOH9PfYZf+Z+rUrcmWw2BubMYj/Lalk?=
 =?us-ascii?Q?ISB5Q4Z+TMdsmngCgyc+gCzSACURI9rZVeiVOCn0hMzsaza2st2b/Fydvarl?=
 =?us-ascii?Q?rRjvVTp3zIPzFUTWtyApYj698E12kxw/yjjjPFw5PkdQpmgKTirUohkjC7Nu?=
 =?us-ascii?Q?NCXUSc46LwwQqzknUcHndFUe0JnX16yj8sZ9+WjlBoGJNLDrxLeEbT6xQXCj?=
 =?us-ascii?Q?14CISxZ2cbHtE50SgCmhIIuSy1JWCeNsWxO4l4qzyAgM+yGcCqeY06az2IB1?=
 =?us-ascii?Q?9jdugvddwqHJkuBdLgqE98Hc7NsdIL6VhbYN/02b3bwjgNUzY2alSZ28/TOp?=
 =?us-ascii?Q?yinC4fNJwNMYlbFxZBenLR3uJermPlSQ4AW//Kh8Dq7eiQQkjIWcO1LohV85?=
 =?us-ascii?Q?5CYzKIECtx3fg7ecvd0o8sEbo3iSuuS6w965A2tcMntAEim3ovLhVF3wx1bu?=
 =?us-ascii?Q?j7eCEeAWYTLgew5ZzEFtlv1dubqBm3WLgjBqoQ9F9NUGqUFtbllzHU6qNaLO?=
 =?us-ascii?Q?lme5wmegpRiuQTb3zUqSvQ+kjIdkyY0EfhalN8NmiQtgJFHc/IvHyAHuHmu1?=
 =?us-ascii?Q?FSrdfmJLDdExf4G8OwhaZuzsNes19P0xUa49toRmawX8ULQ1djEo8nCUsxCZ?=
 =?us-ascii?Q?ngllS6mP27ZwtuXtTpoODB3VaaU1dzf/TY62lxHpaYAg7fkVpWrKe9RqvTl/?=
 =?us-ascii?Q?rYW7NXJtqe0EvVvsoNxVDfwEWq6wWiUQ/WOudELHuG9wbKS24qkbcGIB8NQh?=
 =?us-ascii?Q?ZSBjRHiRabsNt2WPSKdrscKrSteskv4H/n1/cS4vjhED2/Va5ZhcFGF3Sohp?=
 =?us-ascii?Q?vbrZuRZmWOWrm0vwUMXB2K6lPDFwEb/WbLAfSBOmaTQJky/IO3IfG0K8hsbT?=
 =?us-ascii?Q?AA7wzZpBtDsjExYo256ET09LcSCmNvrHjhEdUt07DQkzxEGrvK25Hdxu/j2e?=
 =?us-ascii?Q?Xlnk365xVJDFU4cwTOuJtiargL6hSiim9ZNI9IrnNrq/R6KWaA49TOWyOhqe?=
 =?us-ascii?Q?06ejS+NnamJDnkAWvlbu7NNXYptsmS3781zjzlSp4uB3Y4u/5+aT4wxexxKy?=
 =?us-ascii?Q?0wNTBgfOSGeQhbAJ9wJpPC4rmuJlh/8znU7Y1YJPKj12s+3YXz/ByfSU+6tT?=
 =?us-ascii?Q?LDmM9vPq+oUm8g3JpRkGCeq9n+eaYq4ts4+/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0kPTB08DKGpO0kRhppVdcJVbSgKzdK/wCrjlm0GSZR8JK3qQRuNra5HGlBs?=
 =?us-ascii?Q?8NSGTwGhku7j7jDDkh8TMDduj0X8ALzR0oI03rAdZbmgK2NVKvDdyepe9Ijn?=
 =?us-ascii?Q?Ynu6FfOiWeoZzllAGgxbs9AR4uWCeG1j56Tf8JIdClsm68IdWF3lrBwwviBz?=
 =?us-ascii?Q?ve6qRjuTwvFqwW/U+PtMGeYK5yG1dEMiCiFS7s2STgvWVrm3WRWGwOQUnevc?=
 =?us-ascii?Q?2O7X2Pyyg2VkR8acsIjWQJRWM8ibP9fmvM0k4QuS0DcZdSeQUqcLaJPVbacC?=
 =?us-ascii?Q?8djW+pQu9vyL6ywqm9MVRSOEphIGFYNtwHAGfB9dAfBDlT9Di2TNa9l5o/7+?=
 =?us-ascii?Q?rWmMNYmSF56preKJc2BIOBl8/BdGW7833dpHwxIXkQuTq93o93X9m0agK8GS?=
 =?us-ascii?Q?+vgEYgeou+nRnwL/xuLU6KjUhBzJmwghn2BV4FQ1TfJG/F49xeLqeP8VBEN8?=
 =?us-ascii?Q?OdMr8nd3YXCPDAqCRb2ubabw6jRO7zKy7Ki0PJ1CwbPd4BqAgU6aNyqURhW1?=
 =?us-ascii?Q?azmQ4YX5LFUCl6C9kmKgOuH5cDntNvp84F9OOEzYss64aqlFUZ3OoV/QOp3l?=
 =?us-ascii?Q?Q0YBmQ43zX2nn8+6bJ3ds6IFuDJ+l0eNPZ+vu5EINbgcKiKyvsVdQwPhscQb?=
 =?us-ascii?Q?Xe6M1gXGJ6JVdC7VtqDQd6dvrLfHTdpZp4xL75Xz2/KxPlR10MLkftUhz+Rb?=
 =?us-ascii?Q?DHZOg6EsBWW93SzYzrZ/0RlRImyX1WscgpAtyv7AIx5JI4qt4fxFBlhrd3BO?=
 =?us-ascii?Q?g393jRja2rgqXodqWNzSImZnoMHVQ0pNECU7hmYRkDc1YI3rOfIq8NEq50GL?=
 =?us-ascii?Q?zJ468TEXH5OXkb6kXJFLbRqt9HKOmceYPsluH5rskwpu7RbPGqrHDtVq69/L?=
 =?us-ascii?Q?e25q0CrUUC+1XnYRX8y4gctZ2NKtqkzKbmbrwHWUr/b4q/9OEa7O6LIcycXG?=
 =?us-ascii?Q?MhHl9NoTQVWjhts/5N2zGh8OgjMhsMMN3rRrGkIibsKr6OsiB1ia2j2fZLGF?=
 =?us-ascii?Q?4bskaigFVptPCid/8lQrNZMm9IDhnpIztTSkqeSueG3DV+Vj0ewO3ohU/nOK?=
 =?us-ascii?Q?KoqrXzf0DFTTO72HKxDYpyMa1zNDqSzR2mbdWk1q2O7ozySj66MuJCAQRanc?=
 =?us-ascii?Q?7VkoPMcY+Xla0a74+m+hQ/8nmXvNssmCCJv7S33bf1Eq5bJfvX2qi9x7zyWD?=
 =?us-ascii?Q?hzXeaXRr8sxeiL0d2/JZkM5U7KOl8p5veK0K3k5xqfQpNWGViYc/b7JWzlh5?=
 =?us-ascii?Q?wwN0S7BlqzYz9crGrREDm409ygpNec2hwH4Wty9ucN04wDFBRdRsR+FhCGUq?=
 =?us-ascii?Q?j63ZGrWm3rBO4ITaVXda4iSDwUhrid6HuIMePFvS0UxMnUKBbEUtlgXtvtzX?=
 =?us-ascii?Q?h7rg5NzNchSJtJF6rrOxXjobdsi+H5vZeO3KfN43VxdR5i4810Zg5A+UZ3kE?=
 =?us-ascii?Q?9U4LhsM+ZBORs5aQy6FKzLubrEmGX9Moxob3cuhnRP4HtcH/lVFjEG/VRcoQ?=
 =?us-ascii?Q?7Q/D58dclhodMaUn8b6Cr6WtCmth8wt7jIkfAYAlAKiosQhe9ORn+btQ/0nU?=
 =?us-ascii?Q?mThmTQaZI/f5QxJ5pIA5xM8wOK1vH71THpcejYzj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1305bfae-8786-49a3-8d28-08de23b649d7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:44:56.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAV/AxO9rfyLLrCBwawY72w6IWyPrfOoEkfqctZlW85sT+aNaJAlOdinhaM5xO79z+nfVpVooIYDgsLL48KUtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114459_290585_50A6A8A1 
X-CRM114-Status: GOOD (  18.99  )
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

On Fri, Nov 14, 2025 at 08:13:47PM +0200, Adrian Hunter wrote:
> Use readl_poll_timeout() instead of open-coding the polling loop.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Change 10000 to (10 * USEC_PER_MSEC)
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index d434e2962740..30915d78045e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/acpi.h>
>  #include <linux/idr.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS			0x04
>  #define INTEL_RESETS_RESET		BIT(0)
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> +#define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
>
>  static int intel_i3c_init(struct pci_dev *pci)
>  {
> -	unsigned long timeout;
>  	void __iomem *priv;
> +	u32 reg;
>
>  	priv = devm_ioremap(&pci->dev,
>  			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
> @@ -40,13 +42,9 @@ static int intel_i3c_init(struct pci_dev *pci)
>
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_RESETS);
> -	timeout = jiffies + msecs_to_jiffies(10);
> -	while (!(readl(priv + INTEL_RESETS) &
> -		 INTEL_RESETS_RESET_DONE)) {
> -		if (time_after(jiffies, timeout))
> -			break;
> -		cpu_relax();
> -	}
> +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> +			   reg & INTEL_RESETS_RESET_DONE, 0,
> +			   INTEL_RESETS_TIMEOUT_US);
>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>
>  	return 0;
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
