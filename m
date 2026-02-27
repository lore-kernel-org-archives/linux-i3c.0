Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0AFFEFB6A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DNxuSEFN29fglPEHO+WMeviXN/d1Vflxa4P/nuArGs=; b=Py+P7aj8KCl2un
	IIM/cBLqHlT01AaqE66XUa282HJKnRoyz7Ejg1OZyF2CKYkWaCAx/EYUDwR8VKVkg+reDBl+bQM2f
	ktn7JJyAEfgLHo5gztnT6FQrTpbBVO2QrCxdOiWk4WkVdTBSslXSy5rb+g/cx8M4mFB6CFAoAb5NV
	w7OYFkhWJvVOPBKm4G4TrEAs45D5OwxBKSHfJxGGHq8nMq9ZR1niyZY7pAp4ummhpp956ynxm0f0G
	Kd8DICR1iYXfubwt+jia0R9kdjWnor047PhMNlaXakIIB/g8Uj9qrCT71pd4U9ZTFds99Y+FKT7Rk
	jTNiMKp8DBDAPJ7+Ya0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0jv-00000008jeB-2A9g;
	Fri, 27 Feb 2026 16:30:55 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0jt-00000008jdc-08SY
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGfSDMkI76jy1lhbeZt+cHahSEQwDZeR823fRrSYuEvxD75BYoC08S5K0uZ+WG5etrjIEOBcZGZLW+g3w/XbrfgndfXiur9LfZ19GuJG9YQAYIFK0FkHQnM4Rc9w8dNV5qKJmUbjmo3xJClmQBPHLfmqyUl+rOpFm2V6HMbDN3lokrMu4ZGLf8DyWzgpLp+sZabkIKP7ENORU3EQzln0zwKsMRPiPCdmnUsk53EOYjLr8hS5Y8DQw3MZevAlcKuSWlqrW8xGC7Rf3cO7F8wvcg9fghM4DGCl+hf6hSExZp1mVIfe65/QH63oVwXU+zZpS8Qeea3WryGTu8v5uOci9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxRkiL7S8ZMJM0Mrce19dXhCe9uNAMRR97K1rkLWkNM=;
 b=KnjNfQpYKPcddp3A3yHFVZchW/Ae5HjhstA/4qKFedoB7hJVW6HfLSFsL3Orv7sGIxQ/CpgpGm3bHa6kSywV0Xl88hEs8i2DPdDZy2lZlTcmhrwxjOUWxO+ghgv0wjNyQEwNqi+Iv3IVSq+a8QpFvWQUt/QsbDkxDaeNTA4HVgG55eBsNsjCSTIdq9HXUoYQRWDr9gHwZcmjIi+nB7Wk6y/NmZs4YpcDSBcYn/VAn9bjV+ftr+XOVlndZbEP/QqBFhaLMwj5IMgKnkXZFqTgdU3joifwmOKvX8x6Yhv8CHhLSuLKZRQu8ds5YNoOXT5Fa1t1rIpBQT2GET5n4HSgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxRkiL7S8ZMJM0Mrce19dXhCe9uNAMRR97K1rkLWkNM=;
 b=dRGPmBJ93ZCQEfcTJ88RehfyrY4SJZ0izoKDqQ//ycMlHWmG8AlHTZFdTv8RvmeheEdfa4+5EcRKl5nNASa8bVddvilQyDel5XxhC7AWGjo8yF1wma0POq4ZZM7VsApgfQGfRg+G6NgmdWBqvx2CYfO5YHTLvKlEGscfj7UsmMcrdPwSID8faL/yORuiy1K7frQ+s5UH8/1Ycxa48gGI5Ab6nZ4FFS9d1jULcaLAT4QArSZatgCkOEeRGb+XgKL5AVIZZUctpzQ8SgRMHpt+p+0sj7V6C1JEAGCMk0NstKRxMfRioJQFCB7n1wMAtgRq1K9OZu+pjrkKLn7BkXQfyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB10916.eurprd04.prod.outlook.com (2603:10a6:102:483::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 16:30:48 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:30:48 +0000
Date: Fri, 27 Feb 2026 11:30:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 09/12] i3c: mipi-i3c-hci: Consolidate common xfer
 processing logic
Message-ID: <aaHGskg7d1FjL1Ej@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-10-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::12) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB10916:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f7c974-4824-417a-101d-08de761d9030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: QaCZL1M4R2nExmAm5703DgxYJEaG+rUsAOlLp07CTKSbYuNTuZ7QQ8S6HXd3JrMLNteZ1znRO12rahgmOLYE7/kncRTaFnzCXU+vD4nTbTGo9JIWj9dGDFhENa/o2ZkvG4vhcYCiK95WWjKqLZG4zMyDCEvETcw0A7TQHQZ3/epitzGnwt+gSvVPg7Da9c3/SXvVOY42EHBeisLqSG6/13WAktnrQbaJOZ5Nnuo6+rJXELHF8ieE2W5PhDq/RkpRoiMBn46RA4eY92Dbnwhvy9lxYRGHXRxf0Vh8hpGhqn2H0CjSJSSqV2/2+TtmcZoIqHJbTGNu38pTHGj3QaKh4tIeBDbjwo/2pHwlK/h3SMa5lRcvl41ORzlyqBYGjxr5QARC3NcQgYjkfLyoaeZqR1y3ze6p0upc/qIl7ronXSw5JHEwBg1mvFGICqP2vDYDAa+sVVPZzv023s5YhHsehWC47oz0Ph9F1/8r4MC3wErtDVwxDcAYxOlBbD2gNr89SwjZlq/qvweNv4K+6kMWsEt+vLWoR6mYawaZZZjytfPwKxyJ2s61R9SiS7xQ+dYtmLvMrVOuTCVQAcobWQPTUxr8OmueHxUnZcVbCZqoF6cCREY6qOiynhahp4wIQoyUTnFOMdlE7pqbBI9c781GWz1O9in4xN7Dtg6q1wXTePP2HzX0EgzEvNRdtbEv46Rp4zj2JMrBoT6pycJVrcEYHjEz4pUy68nqWQk/z0AIdg0QvZ9z1wOq9Oyybsg8Q9+JX5JZPXdX8z2nNDE0P0LkxZVCHGBBGjkdkXYi3inIE6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LT+LZOfogInC9BF9fP3BSJOmBolI29TIdoX5IrrahgpH23udl+DAkV6D1JsK?=
 =?us-ascii?Q?2ZiW9+4QZD2s1I5yNmIC2awrxWjycxsLINkOEGqx2dQVdyQGj9vBu/uUJ2u2?=
 =?us-ascii?Q?B69YAHtKnD3Jf9CON6hfB/LmkfgyejWrcMMLy5WPm8DnKbfbO/NoCicnyxrg?=
 =?us-ascii?Q?qO93DY6GH2DkNxA7Gf6AURiKFbCyw1qg0pAAIJLopa4pVzRKBkPnh54JIZxX?=
 =?us-ascii?Q?v6FI/63XHDVHIF1Sy/IUs1o4dXmLCcStnUq3KWXwV260K2x+n1DXu6VEjAc4?=
 =?us-ascii?Q?f1pS98ghI0tAw6yxOCN9BGgpNcsa9ioCIAZeNaqvy13PORhvEORzHm109g4n?=
 =?us-ascii?Q?KM/qZj4OB7i0bJjVsPSJUga5xM3isltr3A58W9AsCRzefAtUWwjXFcnZtm8x?=
 =?us-ascii?Q?mOH9NmI3sdVv+XqG4emH08oVJOaIlZ7GnPZgpOWkv6jTlJ7m4BVVR4idoU0I?=
 =?us-ascii?Q?7DP/Q+FnNHyvcSMmfUyGU5kitlIPB+vIqfWKb6/Lu8f15wh1oTfW8n5fWpvB?=
 =?us-ascii?Q?pTCGLh8Wu2zWiuZxbfEHSSl5AlqhFDdPFNRPWCShgWEvz+kmIFkl+TNcreB2?=
 =?us-ascii?Q?Jd1E0A8r2Om9FHKCH4RHC5rGwwnl/kIImZhijB3uXz0bAzTcTYpeC4qFJW9q?=
 =?us-ascii?Q?OaMZPs2s4VUkaIXJJqaQfUov56hnyr/lKrg7cQcD+e9TMUQImNIyJUTj8tjl?=
 =?us-ascii?Q?YDo15Z9aU8vWjr5Iup85UlAlvaWexe/p7mHzMOfPXHiPUoT/d5KmIyZO+sHq?=
 =?us-ascii?Q?b7MHXNtCclPzcuIRQQlz7APZIb9EwYD97sSji07P2CPlrSlhbQkyDrQlARJd?=
 =?us-ascii?Q?/2mQjxUBtXyMrWRh4AS4KKgmyG1BcEfIPr/1VSwKVkhuCx/8bO+4dCYeqpYT?=
 =?us-ascii?Q?KtOFBS99DZ1BZG9rsm58Ck2WXFPLBtiJe3lFzTceiSk9zAbD7s7umJolEIxA?=
 =?us-ascii?Q?WlRr4psrI1v+OlBlYeRH2T4fZp5qGc5dd61MlmxojYVE+YERmoAcEbJK/zdf?=
 =?us-ascii?Q?6xQBNkKRquzZNOXAqPXm/N8UI8Ce0IrjaPFsp7camYm/todIw6ndKDVXAAT3?=
 =?us-ascii?Q?ZFFRFeUmOF5bl1DLWojlSEkA8fiB4GjA7VBmEeXHsw6V5GOQb+JtGepRwPXM?=
 =?us-ascii?Q?Lb/V1qmYfgA2w8qYuGg0hQZp5C8qh16G/T0Vo1qGzZFM9C3OWQfpMX769VwR?=
 =?us-ascii?Q?MutiVH9zwhiu1nppH5Y3oh47WBdcMGKVaLw6OacJfTIxYPqJYgF3hAHTh7Ij?=
 =?us-ascii?Q?vxOUQtrhZtgJDZp0t8qOCgjbJQmcDDMfoaksTg6Z4mlqNnQABkExp1tDXZzx?=
 =?us-ascii?Q?xN6ihKvUz5VflY3JHceGIZtEnRxz8/2skXjDfCYiHfg/MlbGFShJGKArJx+M?=
 =?us-ascii?Q?GNYWwi9MVTwjmK3HCdLegaiAfhVWfaKIXE/GNcRpCOhDwHNNN2miqjA/+djR?=
 =?us-ascii?Q?awnUY0OpIHa+rImN31JOhEf5Y1pr0tES9su7xD62QOR1DeZ+fxylaUC2OO53?=
 =?us-ascii?Q?QBF3qvk8Xfswe+37tirGtmdEnyqmrBVJhuWjmEVgLk4uCrv98CJCRGmJ4CLG?=
 =?us-ascii?Q?SPKGthafQdYXe7voMn4fmPaUxdlhFJOLmKnNWsMMqy3puxsq9VotylIk2/Pi?=
 =?us-ascii?Q?P8rsugY4VQ+Hg5rSj3fb9yzKxtOaM6JGnyF4qpJcX3l6ztiDTOMmQY3IrQGt?=
 =?us-ascii?Q?/+DXwNHPWJw4ddaCOPxlSEivhbXClW3OfYdsrSynekHt3NAr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f7c974-4824-417a-101d-08de761d9030
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:30:48.0006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNyePQZqUMRmfYCJlKjWOqqrtGX4PmeZN0VXhWMyVikNQbYUh91MCQnQJMnXDUntL1MisHWIv93v8Vpn4obY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_083053_077545_E076B116 
X-CRM114-Status: GOOD (  26.73  )
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

On Fri, Feb 27, 2026 at 04:11:46PM +0200, Adrian Hunter wrote:
> Several parts of the MIPI I3C HCI driver duplicate the same sequence for
> queueing a transfer, waiting for completion, and handling timeouts. This
> logic appears in five separate locations and will be affected by an
> upcoming fix.
>
> Refactor the repeated code into a new helper, i3c_hci_process_xfer(), and
> store the timeout value in the hci_xfer structure so that callers do not
> need to pass it as a separate parameter.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |  8 ++---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |  8 ++---
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 43 ++++++++++++++----------
>  drivers/i3c/master/mipi-i3c-hci/hci.h    |  2 ++
>  4 files changed, 33 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 831a261f6c56..75d452d7f6af 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -331,12 +331,10 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>  			CMD_A0_ROC | CMD_A0_TOC;
>  		xfer->cmd_desc[1] = 0;
>  		xfer->completion = &done;
> -		hci->io->queue_xfer(hci, xfer, 1);
> -		if (!wait_for_completion_timeout(&done, HZ) &&
> -		    hci->io->dequeue_xfer(hci, xfer, 1)) {
> -			ret = -ETIMEDOUT;
> +		xfer->timeout = HZ;
> +		ret = i3c_hci_process_xfer(hci, xfer, 1);
> +		if (ret)
>  			break;
> -		}
>  		if ((RESP_STATUS(xfer->response) == RESP_ERR_ADDR_HEADER ||
>  		     RESP_STATUS(xfer->response) == RESP_ERR_NACK) &&
>  		    RESP_DATA_LENGTH(xfer->response) == 1) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> index 054beee36da5..39eec26a363c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> @@ -253,6 +253,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
>  	xfer[0].rnw = true;
>  	xfer[0].cmd_desc[1] = CMD_A1_DATA_LENGTH(8);
>  	xfer[1].completion = &done;
> +	xfer[1].timeout = HZ;
>
>  	for (;;) {
>  		ret = i3c_master_get_free_addr(&hci->master, next_addr);
> @@ -272,12 +273,9 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
>  			CMD_A0_ASSIGN_ADDRESS(next_addr) |
>  			CMD_A0_ROC |
>  			CMD_A0_TOC;
> -		hci->io->queue_xfer(hci, xfer, 2);
> -		if (!wait_for_completion_timeout(&done, HZ) &&
> -		    hci->io->dequeue_xfer(hci, xfer, 2)) {
> -			ret = -ETIMEDOUT;
> +		ret = i3c_hci_process_xfer(hci, xfer, 2);
> +		if (ret)
>  			break;
> -		}
>  		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
>  			ret = 0;  /* no more devices to be assigned */
>  			break;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 4877a321edf9..9cfe12fb9a0e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -213,6 +213,25 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
>  	reg_write(DCT_SECTION, FIELD_PREP(DCT_TABLE_INDEX, 0));
>  }
>
> +int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
> +{
> +	struct completion *done = xfer[n - 1].completion;
> +	unsigned long timeout = xfer[n - 1].timeout;
> +	int ret;
> +
> +	ret = hci->io->queue_xfer(hci, xfer, n);
> +	if (ret)
> +		return ret;
> +
> +	if (!wait_for_completion_timeout(done, timeout) &&
> +	    hci->io->dequeue_xfer(hci, xfer, n)) {
> +		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>  				struct i3c_ccc_cmd *ccc)
>  {
> @@ -253,18 +272,14 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
>  	xfer[last].completion = &done;
> +	xfer[last].timeout = HZ;
>
>  	if (prefixed)
>  		xfer--;
>
> -	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> +	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
>  	if (ret)
>  		goto out;
> -	if (!wait_for_completion_timeout(&done, HZ) &&
> -	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
>  	for (i = prefixed; i < nxfers; i++) {
>  		if (ccc->rnw)
>  			ccc->dests[i - prefixed].payload.len =
> @@ -335,15 +350,11 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
>  	xfer[last].completion = &done;
> +	xfer[last].timeout = HZ;
>
> -	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> +	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
>  	if (ret)
>  		goto out;
> -	if (!wait_for_completion_timeout(&done, HZ) &&
> -	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
>  	for (i = 0; i < nxfers; i++) {
>  		if (i3c_xfers[i].rnw)
>  			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
> @@ -383,15 +394,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
>  	xfer[last].completion = &done;
> +	xfer[last].timeout = m->i2c.timeout;
>
> -	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> +	ret = i3c_hci_process_xfer(hci, xfer, nxfers);
>  	if (ret)
>  		goto out;
> -	if (!wait_for_completion_timeout(&done, m->i2c.timeout) &&
> -	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
>  	for (i = 0; i < nxfers; i++) {
>  		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
>  			ret = -EIO;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 337b7ab1cb06..6680b8640c5a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -87,6 +87,7 @@ struct hci_xfer {
>  	unsigned int data_len;
>  	unsigned int cmd_tid;
>  	struct completion *completion;
> +	unsigned long timeout;
>  	union {
>  		struct {
>  			/* PIO specific */
> @@ -154,5 +155,6 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
>  void amd_set_od_pp_timing(struct i3c_hci *hci);
>  void amd_set_resp_buf_thld(struct i3c_hci *hci);
>  void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
> +int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>
>  #endif
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
