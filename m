Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9DBCD8CAC
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVvFAt4hEB1o6O0olSL7BSJaoQdbs+r1Ln/qd/AlCLg=; b=HVX8XPA4Vqr50z
	h4CMuq94oxI0bw8qfeY5JRnsirSNhLeYDJlgQnqMjrgThpDgbPn/z44bQtCB5jrLlLMtqrO5yIQ8U
	YEzW8pwlGxA5x+GixYgb8fkr+MBv1miieEbr8eqYyjdrI+cGBPu2igEZUJcXRNUIDUo73KiuIe56f
	b5FOM+N+MgWDrf6J+88E4Cb501V4cgT8BT/h3OQaUyzLjBKFyZNn69XGdYHjFteqmSivFnR9H7Y44
	FeGo7PqMeNx9oh6XzLkx1Dh8sq4fcLgcza0b0T8cEr5lMe7A43ImvbL89ksdThBu+2yUnrk4dOnib
	0o+mVUXEXsDjG8YbdLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJawd-0000000Ar7p-13L1;
	Thu, 13 Nov 2025 17:17:15 +0000
Received: from mail-francesouthazon11011067.outbound.protection.outlook.com ([40.107.130.67] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJawb-0000000Ar7C-1X77
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 17:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtBwoO5fKQze+td8+Z5NmQ+YBXslIJEb09xQgGmsrwu3pF9dLDcIXhUStw5k0Y9Ue5290iXKTUjS09eM/tLVKDpk7RpOeFVjmVFtnHZ6jS3wPMbBL6u7nlCgIOOgf3md8OYJP+Y4aO5gxI9f7da0SxcKWcB5Y6eZi3c3HOENfPoECD0Tp09Z0JAgZ8LRkmj+Ulp/uYsJWLx+8g9YrwtV1tbCF2dBr/aQvUNaSfbTxHYl21mSOr45kW9pXJHm0CcMEEQBwGfkUAZ3MsH79GRSxY+4VH+reZOBOK5nCNrlBgbokAuavFeXi2Xkp3OiikAJZtv9IK881hgltgcfk0DyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omYS5IQlh43Rlsw7DH7PSC6vYwXuGzXtscw9UIl7li4=;
 b=bC9+qkZi24DOpdFNvyEVSJ46qnxoRmM8fgW7k9khT30e5+8arxwzsMcDL0w63Gxpu4d1xq8yk3REtCLF4dhDOZBD+oBapT1vvfgIdXKyIP4AYTIMagVgkOAEc1rUiGl+rDfFDh1t9flybaoHAW1hoEFF8HbseaaNVOxMiKeP/5JhAT7ao5+XonbqaTxFCufVwcw/tUTRzQmZ9qR/EYbiIRkb24woC4XJhvjqPkMo0DLOkf00VrYYikA6NI37BA6OVGyACK+pklNHaErl/56saCDhLbk8pCg5p1r+pJWaXQp2RKvjU3CzGuEdFQgRRNPEKsHQsryP+rYlkWuS0gXYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omYS5IQlh43Rlsw7DH7PSC6vYwXuGzXtscw9UIl7li4=;
 b=RUJy7LSayc5kgvnLIRrHV4T0byDGIPSeUTxbpsakrAax3AiW8gX/CUbrplddLv/vBwHAZg87znVZTlAl2i35W3Ua6iGPI9tsJAeGYovov+LdEW9JoXvFy0fAe6bGZ5HpBP2Z1zaAuSn3ojg6WDzjvjlg1uiUbv3bn90SEhx4j7njmHYp5Rawzlg64OgzXOWJCstz81jrjpZ/swIgUrN47ccKOfKZlNA34oPYhKCIq5mR/3tbszKS2igl1ormMPpQh0Bn1CJ93QS2Nh29W3zCxS18AJAqZDECuT8LvptgsP8Io95qNyLHOVkkKOWdjEveFYP8/VkbcUH3DaCCqO40fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB11573.eurprd04.prod.outlook.com (2603:10a6:800:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 17:17:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:17:08 +0000
Date: Thu, 13 Nov 2025 12:17:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related
 identifiers
Message-ID: <aRYSjYjDcC/KAQv3@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-4-adrian.hunter@intel.com>
 <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
 <ce8fb9c4-53f0-40ec-a296-d8cabef5dfe7@intel.com>
 <aRYE9Lkn5PDLXTXr@lizhi-Precision-Tower-5810>
 <f4180f52-31bc-41ae-9ac9-24553099f82c@intel.com>
Content-Disposition: inline
In-Reply-To: <f4180f52-31bc-41ae-9ac9-24553099f82c@intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1c18fb-0fbf-47c1-55ca-08de22d879bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a6hdBxgXNxAXVvypCKOHm+KUK0I3YZNPLdCJOq7oCjND/KpgeP86j4WsC+6W?=
 =?us-ascii?Q?GtOTYwC0FAfs/m8xk8Ucuaviv9db0y7pzr3mLh3vw6SfYWG8KEy9+kaszHvR?=
 =?us-ascii?Q?10q2b0Vg1LHwzNBtjOfaQ77oLQ4KQB5MY4CIkWIgridYyWzKr5/ERbXwAHsj?=
 =?us-ascii?Q?QuNpbKudpIMagLwmIiTMhbpBfWg+fKrI89AIvMhr7mpD8VgvvlENW68ghrn1?=
 =?us-ascii?Q?yMf5GN1SBwmYhAW9TemTupm0vCMdnoKSyTRAhFJYIYZ8qkZhAG8UNdyaxrIw?=
 =?us-ascii?Q?2MCT7lXnrQV4nmvxCGSRdSnfPco959VpvG9bZDdHpNE8MoIjzeLgnUNuhbMO?=
 =?us-ascii?Q?bqNq3beRjSq66Vjtfa1iRW5WeYhxk1RRy8v6iyk93Bc2LEvIKA9Nci9VwG9O?=
 =?us-ascii?Q?abU8IVuIv915mMwysW8ZyI5B2aYg24MvPXRmc5w09q/Eu2o/WZdACM7NUors?=
 =?us-ascii?Q?hWgy3/ayFtNKABCt7dGC5OQdouZUhm2APhj6Io/o+NGgSzw1KysbEYGQ9MQL?=
 =?us-ascii?Q?doztKsO+leeP6GjkMWA07i4SgDBGcDtmN12CRzfT9mUVNT618UB93E34BdKZ?=
 =?us-ascii?Q?8q009J1I4Gx5oQQVo6Fzp9RlJy9XITH89aFYK8nxbfsFmzaYz+iGfe87oLMv?=
 =?us-ascii?Q?uki1RszQYfzsLpq+JRBxXYYgJzgEJpVGt2MljLo0b1wXQ6IQnMoih//lIpwa?=
 =?us-ascii?Q?VaohRO2W2e+12KeTP8O6oke+NtAzxU8TAvQQYOVWkIu/fKcjDwguLYlQLIzw?=
 =?us-ascii?Q?rxiWNpMb4UlPvcuW2i3fTMszmQ5+MgMWFg3zsMMLeADlSInqBYxwXjJfWOFg?=
 =?us-ascii?Q?DvrK8beKW1gvbrXQmwz/AdMUvdo2gZ6jnTr6BbDadnkDTWD6eqXXqhTIqIp3?=
 =?us-ascii?Q?3ocCDQXo4bxKDiYGj9bhpnunPSIKeKShp9hvoHsnwWWhMeS7i0wEaTNNjJF2?=
 =?us-ascii?Q?XgXtKhE/orBrsRWIm9WC1WVfb4eB7YNt+3nawOnr8SARfUmSyA3LFYdybpzs?=
 =?us-ascii?Q?j+7K6v38QTkIzUbBnm/7ImYFchno9IZvfhVtFltNHdzt+vV9+KQHfuraqGbK?=
 =?us-ascii?Q?5TVEWgmnLvCMmDJNn4x5N8uCRfFX7EiwH74Ze+FrN1/P1THiTL+3OpxnEmg2?=
 =?us-ascii?Q?ksfdKXAuYkmY7kEeYvrYF/aYyRvlGR3slzSwogd4i/RJgXKojooaN+g/QiNH?=
 =?us-ascii?Q?PVwSJbhSqsbCJ+YQbU6r7SJRysDoNTJ4z8FVo7Hwhfr0ARGgskSn87F1Ple1?=
 =?us-ascii?Q?Y/kEqdB9JYJMwXakygJVB3E7pXZAGrb4q3o6tKOFAZa9STLHszpu31DKp5Iu?=
 =?us-ascii?Q?qVAIbozPIfbXY1/MkzI3WxLxbz8wOkm4SRq58g4xqsNclxnOiP9ZxNso8jHz?=
 =?us-ascii?Q?g2VlPRhrivGvlysnmAs4Cl2gAh+LUue1vcrAJdq1BoWUdegq4S8Yi47LuYp2?=
 =?us-ascii?Q?2Gkk7fJMDW0Mig6hU5nwuuhmtV8LKeS03aw99UlAg1nxOc64wrXpPOUoMhos?=
 =?us-ascii?Q?Q+x6EGzIJ2JoN7FnXhiHWVHtHWNkdEuEoLBT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?edXIU189UwhI1G8KhszX4Vba0GROCH9go1fxmlg5k/ak9BX5qXEAIIDpTL82?=
 =?us-ascii?Q?Jloe7Z6ybNzYlbs1XogPYOMEn7U7/JZmZtstA27DW280GgqApXi+VHHecfA3?=
 =?us-ascii?Q?seuO60g9dE8CHiEni9R0oP4vgo6M3lIMpgPnTHs/Y0lkyu8Dd2AIpXdzoEY5?=
 =?us-ascii?Q?ODuPKoe5z2uc0zAZam9om305aahPg/irEb79Xpivpnp55YTryypE1IWknzTT?=
 =?us-ascii?Q?9Vm4reJtTz9/MlvfIoVQ02YO17ynQgl003QQ8TY+Gds84qlek3ZoGJ789wPE?=
 =?us-ascii?Q?J39c+KpyPMNI4JdoCUS0SbGviTfrC2llCQvmxPsmAOTNpoKgkZHjOBq2yrqY?=
 =?us-ascii?Q?gICf5N48jNwGfJpKn1xiAcghvkCjxW1W5c+phhfbvWErmiDkSprK84KIsTWI?=
 =?us-ascii?Q?xZJnKMsJf+LKk43YlGF3nq+pSqMnALxPqHjgyLYYJPmDShQrhxG1oW32FbEu?=
 =?us-ascii?Q?FoyID3WhuYctYCmK32b+C7QsKEH8rj4kUIo5SFwjr0mKFVXUfffjvcP12Ukg?=
 =?us-ascii?Q?6iUlFc+Z3dLJo8MU2C67Sxt/KP3qzGAha1ainVvosYZHhk8n/YFng4lZXZ1P?=
 =?us-ascii?Q?ersETKbPtni/+twdANMqb0E85wdazA0bJ4sCaDaJz0tlGrlKjwKUL9A9BMxl?=
 =?us-ascii?Q?Oo4cY1iFPQZnQA+uZrJqylgg4+OwTf9yrez3zyrTga4H094mG9k9EQWfTJzV?=
 =?us-ascii?Q?vy+CD9V4PkSj9kRLONBbsioX3BrK5tAxfHVhZZdNLrwcU8SMbznZEpEWwkPL?=
 =?us-ascii?Q?MGV24rTLEUGb0PBts1p9t6LTFejBsHwww3PtHtgaC52JKL8NLtA1KN7ORhm5?=
 =?us-ascii?Q?AFZADP56QVGf/py06Pljj1n5+cN2D6gXSxdj2/0h9v1C/ke2dG9xLND0zNSI?=
 =?us-ascii?Q?qqKLfJT5I0Ewbxhk37GVB35xyt1Zc6OePhgeklSxn+lWwk6ytCINWG9TGW03?=
 =?us-ascii?Q?R/m5ONUxdHKbUMTPBW7wqekxitFnQSIfQNStDTKz/76ozS+YKZ/2YIw+JHL6?=
 =?us-ascii?Q?hv3I+3QBGWrSUMy40m+5WbgOaHMs9fgylwmhcvQR2KlwKO9Ojui1NEfIth2P?=
 =?us-ascii?Q?nPcpAZ9miU8Kso3sfa88HVdGrFM/VvbZgQTvZUkd2dsjbMp0uhO9FTb+e+Bb?=
 =?us-ascii?Q?9qTY2hCGmuE6g5+UlkVrbnot+8ciDjQsDBgGhsDSzX51+YChya7QIrRWwOke?=
 =?us-ascii?Q?fQb9MxFdq6F5BoNkkip0vDBgzHJDkk8lmHWXD6VRSQPoV6/RIpEwfWkhi7Vy?=
 =?us-ascii?Q?8233K+cOC4/+4iQEfXpq7SyEk+2sSHJeSc6Dprc/niTYM8nIvummVvXASsAY?=
 =?us-ascii?Q?CSyBIS3T0ol3FA8eCAp0nKJQUZDl0pw6Km+vCh+Ky4lQBeE1KPROgPkYT/rj?=
 =?us-ascii?Q?LLViYq5D5+gxDjzj/pIPqgbvdH9Cc+mJ97WsGR6DPtWg+UMuc+o71oTbnxOh?=
 =?us-ascii?Q?NkkMMS1IN0yR0EvoEk/KhY3tEhr0WYr4nZDOoPZKgHrz8b6eAchM41qgKJRK?=
 =?us-ascii?Q?MQQvAUNGuREb8t1ZY/p1+Gb4O387WoHGOjD0Eoz4952JB9lEE5ROGF8yM638?=
 =?us-ascii?Q?THa1XsAgiEkTtiwDDAWJnk9N8yarspEqN4i5unNA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1c18fb-0fbf-47c1-55ca-08de22d879bb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:17:08.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GjwHyxXWK5Ggywnf+OeV5u72O+TDbD8DR2y9ctybzf4tt0Ai+M6YZcuZEtBk3fLxAy7qPI4FLJvFm8BtGyDyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_091713_405467_716BDA60 
X-CRM114-Status: GOOD (  16.22  )
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

On Thu, Nov 13, 2025 at 06:57:41PM +0200, Adrian Hunter wrote:
> On 13/11/2025 18:19, Frank Li wrote:
> > On Thu, Nov 13, 2025 at 03:01:02PM +0200, Adrian Hunter wrote:
> >> On 12/11/2025 17:57, Frank Li wrote:
> >>> On Wed, Nov 12, 2025 at 12:03:29PM +0200, Adrian Hunter wrote:
> >>>> Rename some Intel-related identifiers to ensure Intel-related identifiers
> >>>> begin "intel_" or INTEL_, and for brevity.
> >>>>
> >>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>> ---
> >>>>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
> >>>>  1 file changed, 9 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> index 617826628dc4..c74cc511a344 100644
> >>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >>>>
> >>>>  #define INTEL_PRIV_OFFSET		0x2b0
> >>>>  #define INTEL_PRIV_SIZE			0x28
> >>>> -#define INTEL_PRIV_RESETS		0x04
> >>>> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
> >>>> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
> >>>> +#define INTEL_RESETS			0x04
> >>>> +#define INTEL_RESETS_RESET		BIT(0)
> >>>> +#define INTEL_RESETS_RESET_DONE		BIT(1)
> >>>
> >>> These are already begin with INTEL.
> >>
> >> For brevity.  They are long and "PRIV" adds nothing.
> >
> > Generally, needn't this type rename unless you need add more registers
> > defination later and want to keep consistent.
>
> Patch 12 adds:
>
> #define INTEL_ACTIVELTR			0x0c
> #define INTEL_IDLELTR			0x10
>
> #define INTEL_LTR_REQ			BIT(15)
> #define INTEL_LTR_SCALE_MASK		GENMASK(11, 10)
> #define INTEL_LTR_SCALE_1US		(2 << 10)
> #define INTEL_LTR_SCALE_32US		(3 << 10)
> #define INTEL_LTR_VALUE_MASK		GENMASK(9, 0)

You need mention these informaiton at commit message, such as prepare add
more register definiation and remove redunction "_PRIV_" to keep consistent

You can rephrase it. each commit message is independent.

Frank

>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
