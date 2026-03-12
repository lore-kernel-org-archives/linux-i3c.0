Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1159FED2E9
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ts7bK4cqbYWIVddgf45s3Ho8huxa6BARBTVT5n+s3Tg=; b=KVTO7zO9vuKwSo
	tbzThpNUcU4xbA+yFKFG833n9b3pnjF8zRs5I0EnybydD3L2IxiWlq72RrkTUq+wl7jqALt3CbZaf
	PuWuKJmTD1r1PL3VBbDjJB05wnqQBeoINwAUFKq8ZsC34NYXzj4gJDuauCN6TVyX19vLS3pW+my9r
	lBMJ2ViBbmNA7QMI+TcwLY3lvj1zcKsv8NoWQf60SulmGiJbzYnxusF766lmL9ToZIr+wtk1BV2Y7
	Yvm6xNoaWZpDmaj4hhzY620oQF4DAnAI101w2malY3p1lOkQFU+txs9vEd2E2t9UH8V6EVLFmMWNy
	NnaLnAsEg82iocJwXk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hP6-0000000EG6n-30UU;
	Thu, 12 Mar 2026 14:52:48 +0000
Received: from mail-westeuropeazon11010014.outbound.protection.outlook.com ([52.101.69.14] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hP4-0000000EG6I-1WdP
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 14:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjWd5ReD6AMszlBmizen3JkAj+FNpkji1dOv16GLS8Y+AbnwgkRmaTGQqaPyVSSQsVBJv6ADm9vg8rPXeuOQ+vb8Iy7Kh/Nbr/s5ROOPNrSB02AQyusc7E5IgOH2GVueIitA6chJ/tcir/zmdYVbMT//VkRFUP8Q9xnlBOdVbq9Rp5wE3hWq9W12SCybn23LGZEwwOvROZDqWXUY6xA4p6UPc1fn1jjxVpRmsIBZupRPnFiQ3vU68WUQr+IoNqzOsQ5DQP/EMuSQghK8wlgD4ncqNGSAEIQiMKPxAmXGZ1n1JxuvQ8wLlTHLpBycXheq2BDtNHW353hYG5bDzsJhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RkHsrd+dblFNwfRAcmnMlk+tkc+MTF+MFLcvxgKwbg=;
 b=OGdhxMVh2hZ+tWdBZQXCXojZ2Zd32kywDM2E3s0TPvHtPrq0YwqGSqzVZGcsjOrMrI3uTTv6Pd3nC1sYCnOrgUSN17nmaYC3gQqJrj/xfN/xEpW74Rdwc/IZ63Q8IK3qzINQIy5K41UtqpLy0L0Zy7+6nEWm0sDEA3Hn67h0mSJaATcflF1FcjOhpPQjVcZyB76TMA5H5A8rgATH9F4cavvo5n4hl1Hl37znP1fcAZhd+yjjkPIF4Bwc3umFFCBqnfiUkecSlMSP05We0KoeEVyDWsfSVlxD2FReG5LAkUw/vfLUxBOoaedu4vehCGQ2A/sMbfrlEfuI2E5mOe6Nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RkHsrd+dblFNwfRAcmnMlk+tkc+MTF+MFLcvxgKwbg=;
 b=hyyv3uTyD7+JMjrDqM5LcQn998hWu4RlABqLN2y0IMGESsN4qPWsh9ymHcd78/sv5tLY3kmxOR4KgE3H8/U/44+5FTjf231TRI1V/U4rZY2vSZiLST2hQrJ38S2aQGwEv+Vo/8abXshuHrcefZpt0oBpBNEWWIZrhSGk+Rkzvv0YNeELBKdX7/YP80ABr+Bdc7iNc4dlfbOqJUgYkCSLlt2VDV0fftskgjQyQNO+VQI0oej2JI7I572cSCuF2pwBBlgXaxIz9iI0wXQlgVJZcnyozwPfZ2NBx0ZR0j9utoMoeMCHritAucSP0+akqxBQ1afst0QSPQ9hoIzviCU2DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7292.eurprd04.prod.outlook.com (2603:10a6:102:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 14:52:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:52:41 +0000
Date: Thu, 12 Mar 2026 10:52:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] i3c: master: use kzalloc_flex
Message-ID: <abLTNGg-ozq-Xa4D@lizhi-Precision-Tower-5810>
References: <20260312001534.24423-1-rosenp@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260312001534.24423-1-rosenp@gmail.com>
X-ClientProxiedBy: SN1PR12CA0100.namprd12.prod.outlook.com
 (2603:10b6:802:21::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 001947a7-70be-497e-e8f5-08de8047029b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|7053199007|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: FRk0dlQBM4eb403BON5quYy4q7+3L7CMcRKPHlZRhV39OZRmueYgJ1qLPRStDXdOYDo3zUt3sgdrkyDrv8m5GBVRXZqtSJSJBjzyWeC5UbyxTUpSIuw8dHu1OoWnY17W4C/3TT8SJXJsMb9D+HcA2r3dqXLpH7sERW+KUq9v9l9BRKy548WoSgryRbAyYjvnh+hnOEGED3l5mN6+WQETkTstZMkjw6Ayk/3rAYCCl55Z7Ezioy5txLUoinoZwJyNbRPJJI2NnXBz2VhrcjH00J67Y8g5r6tFjeonSCJHLzQ6/IHPmLdZG/gk2NKJ9h+XcxG3istQfDNKEtu3iOVYpanJs0YK++OFq0xyVSlLbwjf5TLZWhDbSWAfv6H5vjG4DLCHkvm0j/Vsp24SnrrfrTKz4Z1eK/ZGEaWYVMQC0TVFvEMySX2HtCIg2lo5YM7nnhP5gxGEXqxx6QGJW1cfLJR3y5CLGWjQGCasS+whzGuHrqK6ejaH0NE9NpB6OMDar1GBA+FnZDHWqtuoAb9EU173Nl27KayPza6GEBVzkHsJxzPmvo8XqZPXIFbrkdOBA7Bua9p8XXYodi2JdBb/0sbVbx0QsFnhpcBKfR+FzL43B1GdR0EdHA2oze7ZwAEh+Rdbna3opVflKWngT5lVAXURxPWA5abTTZX0yqrQV6gbJE4l+xZMcehkYo8FOuLG9sAGAEEB19Aep3Ggzt0G9qFl9Lf9Hv0pBzWM24oNLQ0cHwoujydsLnfBl1WGerYK4L5n+0WzQOp2T6Ia5cFUp1UrdTQKzcWX5q2mT9DotH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(7053199007)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+vWfHOcRHju09aDcLZBavK5NazJDzyPfjs2GPzseOLCZLCNVavxJVFZmzDQi?=
 =?us-ascii?Q?B04XyEpey0TnYT0tcN7NEO421rAIdEZkTg/GuFC2eKtdWL1TSm2bksDF2lNv?=
 =?us-ascii?Q?2W3R9+FBew62udMAlXTwVT2UvHfQuWu2QX7QRzB3INuAO9ZkRUJrEEHjhgxQ?=
 =?us-ascii?Q?PNtebbuRv1y3XWlS4pm2nEkalOKoH0tm7DepxDnjB5k8fARJdVdzE6T78Kf3?=
 =?us-ascii?Q?vWr/DMNLpK+UbWkbCf2ons6ofoho2PmLbDu0GA/sa453EWP5jxJIn+xyCjyO?=
 =?us-ascii?Q?g0QxO5XFiJqWwtU6nUBqMduOtJTXAfct8QdMNl3hAElaDl7frxioGDx/Rt0y?=
 =?us-ascii?Q?ba+lVltY+by3zMkOKci2gke65uZCnzBn/gATTCMemzxUfHNqapk/wTxROiju?=
 =?us-ascii?Q?CeHX0UvtIOQtlue3m9Cg+hjV/6c/pNC/sx2Kl+0U80thgniYhjKFgWq3kzRj?=
 =?us-ascii?Q?e+rmdEcQM+yQhUaHvu9OSQiCT4wuwLaabKvlhGPMYzK2ucwEtYTVw1473jdO?=
 =?us-ascii?Q?PMvhmN/TRJ0e85aWzdv2WDpI4gpMLbPg9UvaLDsyKMw1iCbeT1KViZz13MEr?=
 =?us-ascii?Q?Krr7ubJyLjHxCTM3XCvr/fIhRr6AHe/qQ5geVDNaegKv3cDtU1BhHtKGmFQd?=
 =?us-ascii?Q?Yv+wPtY4//AIzfTam9byBjXKJJxn/dmhm/JSHifVbnyZDmGCtalUSdLGKWgX?=
 =?us-ascii?Q?QuHY088Cij+k8BJr1pBP/UwZc+gZpU3BKYh0UQC9S8vQxFrbTRR9ieuy68cJ?=
 =?us-ascii?Q?HNIiD3Eo8SPZNRYwb7MEEVMgcmkWM6J0W+4Ly7UAxM7DnniOzVyWEJHZXfb2?=
 =?us-ascii?Q?2No20zKHnf0oF+yuEIN+K4avHOkRZYyJjqbTmNeYAc17SQMuMpcrEGVHPRCZ?=
 =?us-ascii?Q?o3ve09jbHy+stQSsSgqE1qEXeIMq/9gjlLY7DOCaabVVnA+m0Jd0u6KmmFHF?=
 =?us-ascii?Q?SNp8+l7w6yf8yoSLv+YW1O7zbCzVaM1jNGHmhsAaEclo+N8CQ9mvJnVq0Zvt?=
 =?us-ascii?Q?DXKYH4S/osTsDW9H44G/VS9u7uZrRd9bzS99suLd0eHGj5OPq6Cp+gyPqsPt?=
 =?us-ascii?Q?93QqqHrOmvqemzqLp5v/pQnOOiGX8cDF2bFAX4femXjPn6yXZpZ6Zrri/Clq?=
 =?us-ascii?Q?NatIjf+TjFxK0zMrOk0wfLuCrpa73XiXMNysvajRMdjLycRuZ1TPZbSAixrA?=
 =?us-ascii?Q?Y8ZDB8H5qIatsWcWyrFxn1zCKjakCn04KNfrJwLbltFcuJdsMkGRG9KS+Xcg?=
 =?us-ascii?Q?O4ehAUJoCe6f/mBtNBLlrL53wcVTm8spaqFREYluhL2dQNDaLhIMPFmLWhnk?=
 =?us-ascii?Q?LD0JLKeOAZBUJn607UBJbXm9yuz2gQhoDXyXXRNWUWrz9m+zEsLTzzXpcIYD?=
 =?us-ascii?Q?pO3a3PAb8Cp8KAheYGzPyPuQlgxyQUQprP8hYlaQpo4J6VhgbCkRxh8hOqrR?=
 =?us-ascii?Q?jra7Q7AMe87mMUJftdIj2A5+s/FpMWJFE06k4D/ZvUGCOglctuqJLjDOuyDJ?=
 =?us-ascii?Q?2mkIQS9dfAkRXyvwBgeooK2NHeCBOBmEdRE89jL0cMLx8pXfqQcW/bR1fIi4?=
 =?us-ascii?Q?G2NF75B/fvxv+MFIluLxlecsje3b/732lLUa+IxGEhdRv7DRXt0EeCsaE7qX?=
 =?us-ascii?Q?NcMJriIJ6Ja2EYhw/lZqMMZ5kgQQMmhHOAU7PD8bcrKzO+NDx48WzfLDy8R9?=
 =?us-ascii?Q?P0HKy+fKiGmUr1y/pTW3s6LW5qu9gzeWhsWft/irzFjSfVxV2k8+OJTaD9Hu?=
 =?us-ascii?Q?oiiUBQrYfQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001947a7-70be-497e-e8f5-08de8047029b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:52:41.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQtiMpBwkhW6fSKRfpPtj3yQg7J7luVbKTUMbjb2ZoRvDqW91YBFfTz4VfJz+Kw3kW5zwEbRr/pb74pFWCBN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_075246_422422_67E553F0 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 11, 2026 at 05:15:34PM -0700, Rosen Penev wrote:
> Simplifies allocations by using a flexible array member in this struct.
>
> Add __counted_by to get extra runtime analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
