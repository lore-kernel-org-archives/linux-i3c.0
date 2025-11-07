Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B906CCF9E3
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Nov 2025 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPu2nwca8Kin0nwSL4dfuamMHjtja3mE84oaj5cseDI=; b=y5lNXG99BihDi4
	NvTiASXHXl1xdP6sQtxnzJqspucFiZYoaAoh7ftbMIP++ASZMQlO7ZFZhRHpYH9i7tNEZbu9qYTQt
	mFgCdaszzJ8ATMhSysMEp8MoO2jzpJfNNbhvqWXjJuA8+Iq0fIzB3iUfCiXX8uBmeWLptpJ9ynuEz
	P9iYQW6xBTJmgM4benpPrJqE6IL4shBKdwelcfLYCGkAD999VEoP+rx6n+RMEZVfEujDk/ZAKfnjP
	0HhehwcRcX6ai8+Ksw7xfAXUUIdeqIPCc1DbcsY1o7BznaofoSMtXVWsz3PtOUd0lIty+eBBw9gp+
	n/BOsFnK5IzoR1d9LdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTZG-000000013ok-3jy2;
	Fri, 07 Nov 2025 21:00:22 +0000
Received: from mail-westeuropeazon11013016.outbound.protection.outlook.com ([52.101.72.16] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTZD-000000013oN-3ECB
	for linux-i3c@lists.infradead.org;
	Fri, 07 Nov 2025 21:00:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Euw0XyKc8o+ZHqygGt9ElRHCa+mK/Pb9v8G5Vf0HRDapTdteczqFSDdsB6M38cbdiG1bvR508K/zod80MPolY6GrxEMByFifdEB2us8pV4Zep7VpVekQWsw8C4efgvi9QMXbJytoV4kpKwbqlu+Q+/iCiZhBO1qCfxa/LirTCRPtQA9xXAeSW0ocGGACSWymBAifUdVhCDEO6hZ2SCg05oJsthTLvxToUqB3ZkriaG3DpjKXI1LM2MTWCpm/chqhm+62oVEPJ9nnDv8D3eB1MsAne0NvH/GMNPMNQGSvXW+LafZIjWa3LsqR83c+0yC0zqmLhPGtMXWM2py9vR8OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+zdc6tUHvpLCY5uCE/ZWMGVLaELxGHpcMBX5ycwWiY=;
 b=VG+MuqIClgrzQ62Qgu+HQDHwXD4oyNH7Tvu93H7gNHDWwe77RJk+6BH88KcQwtxILEbgj3rb8T5SINvbfmoEPhbEIOVNIcud8xnnTan7gyU531/1n6R0qwzTYXlhOEpcCuHz7yq1CEDGQDn7RQazDzMuuUsfTcSRrGZcn/kTFD27rVqPCNqjrz+40VAgiT0xrD/NXYFCZ6KiE+3KMkOhd7ij3XJ/ANVZN7xCld2fsg5uAXuXNg0TeEbLt9OrAhKbmb6dWpFnaFpVRce/ish8tl+1yZ7Sj2Erpsejak6xg3lbVp4w512enRBh28Z5PvcJn72zyfGhU6CcWMGyf6//+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+zdc6tUHvpLCY5uCE/ZWMGVLaELxGHpcMBX5ycwWiY=;
 b=djpEyGdFUu/BOclbZfuMfn4M+TuGQn3fDGhT5fQZ7T5XzZpPsWtisJ/FvhB8UCv5s594tNAvT2gcEa9reWjIlxQAGGS3hnKk0zOdv9Pm+PcqHbfgh6Crw3apcVm7IRmSm5hs7Vd8spyAn5RR3MIe5X6bcjvh8v+xULIDyIj9MKBa3Z44nZbrVlZVs4zEFXDcMtOo9evjWs7Hx8T8tHEPFZ6nfHN3XmkyZMZmqFQ2JTFLeY//u58DqR9gUdqh7wXnZX6xSyC2LCmjRJbxIhXATSMoEW4GdsDX3SSdpiDzL8yh6krz5LDvB0iR112SJDRoJTHMtsjszGmvT9mUg35z3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB7800.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:00:15 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 21:00:15 +0000
Date: Fri, 7 Nov 2025 16:00:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: master: add WQ_PERCPU to alloc_workqueue users
Message-ID: <aQ5d1g95N86lXXT2@lizhi-Precision-Tower-5810>
References: <20251107132949.184944-1-marco.crivellari@suse.com>
Content-Disposition: inline
In-Reply-To: <20251107132949.184944-1-marco.crivellari@suse.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: dc54d9b9-1c2e-4d1b-4580-08de1e40a63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkdNNkxDcVdydW1ibFpKMjZ1dFA0eVRwMGJON3NTbVA3R250RmVucE1kQVZx?=
 =?utf-8?B?UVh4cWR0by9sQzdPdGJFYXBiMlVzeDR5SnF6ZTI4bldxeHZCT3RmOWMrL04v?=
 =?utf-8?B?WDk1WFhmVDdCaUpKVWVYQlNxOFlQVHlsMzdxWjUrMjN1aGM1cnU0bDRNTkZT?=
 =?utf-8?B?KzRRTUdlUGt5RWkxOHdhWWl5c243a3NGb012UEJ4V3pmVTRSbzNoRkc4L3ZR?=
 =?utf-8?B?WTJtV2d4Zmg5WldzMjRBb0IzMkcxbksrenVvWVE3UnFkcjArL2VzV0ZIM0lE?=
 =?utf-8?B?T2JVdm1YMno1L0tMZnFBWGVmNUE4cWNOSmdubVg5eGJnTHMvRkpDOXpuQ3Az?=
 =?utf-8?B?eU1hQkFTOUNzTkZVWUpyTW55MTR2bURxTmJpTi9wZGVDSC9qVW10SXhoMER2?=
 =?utf-8?B?dExpNUlqZDlZajhzS3RBVC9lRVEzSmMya0phLzI4QlJrYm40VWUyTTByMnNr?=
 =?utf-8?B?SmVBdys5LzhkVkhzN0tyOGVVQ3lPd054cTBieWRRMkptQ3NCZkJGbnpRMjBT?=
 =?utf-8?B?UVB0bzRPYkVOdzd6eUF4VEs0d0x2Mkxyak56bFFZeHd4MjhhWXkwM1RQUXVo?=
 =?utf-8?B?S1ZXMG9UbHd5eWJFWHkzU05XZFltOEpXYVNxL1E4VjJQZXZvN2Z4blkwd3E5?=
 =?utf-8?B?TG53dS96SGkzbjJkVThBK3owdkRxcmNyU1ZraWJ4WlhFU0tvcFZDemdqczJM?=
 =?utf-8?B?M0oyUERrWHFMUVNTR1dQdU5HQkRLejg0WEI2Z3dqcDU4VGRpRHR4eWNOSVQ2?=
 =?utf-8?B?NzkxWk04eXlISlhuTkxWdVFqeVNYWHVGK3dIUE9RSHB4QjgwZUR6QXVaSWJ4?=
 =?utf-8?B?K3hWSkdYZ1pyaDMwWlFtOXdUTWF6eDVMWlNCUmxpdWlEZUJBNHp0TktEMU9H?=
 =?utf-8?B?RzNUTDZpbG1kK1lyaEhCajl0MmYzbXlTMHpiZVVlMUZvdEErSEh0aTJKMmNn?=
 =?utf-8?B?WDJGTmVRSXg0OFRZdk1vZld0VW8yY0RpSFJmK3hwNEk4Z1h5N3FNMlVLYVdV?=
 =?utf-8?B?R2p4ZHp6NHFLcFdCNlhubmFoWFBjTklhblZhRjhYQjk4UnAycWdWd3VxR2g0?=
 =?utf-8?B?Yi95eHNJWDlGNFRxVldMN3ZIcWJqaVB6Ny9PMFNIVThUaVh6ekV0VWowUThk?=
 =?utf-8?B?dVhaZHc3MnpUTlVuZC9XSFhSUmxFK3FERzVMVEg0VUhyTjBiMWwrTUU0MnZT?=
 =?utf-8?B?eHJzWmhHbFNRQ3JOL3l6bHJ6ZDVkWmZDS1hpOFZNT3Z1NGJkVTVMNHlMY09R?=
 =?utf-8?B?TWxuTHk5UTlGbThqYXNXWUZXSy9zZ1J4WlhNWUFsc2dHcHFuQUxMOXkvTUt6?=
 =?utf-8?B?NThhUFUrMko4b25lY1IrYkwwUTE2ZWV2UGhaYkJZRlg3dEtXT2d6QWVqaU43?=
 =?utf-8?B?Q3A5NE5INk1TTERTRVd1QXZyaWlpd0IwZ21nWk5kcVB0ZFhmYmNUM1FaUlo3?=
 =?utf-8?B?ZDk5TENRU0wvb0hIVUhRczdxd0RPei82bUNodmEwK1dPdjhjZTgxZExDWExP?=
 =?utf-8?B?NnI4UzBWNkU2VVVVL2xHcmRITFozYytBMlduZ3hrdndjc3VBckNDWGpHV2xL?=
 =?utf-8?B?eGRVMjV0U3V3eWttbWw5eG1mNVFsODVKZVlkeWVxRTZUT2dlblkzNkhCTDNW?=
 =?utf-8?B?S1BDRm5IZzdoZ2xTTWppazhsblhoekRIbkIzU0lEMkF5aE5DR2R0UnJuUGp4?=
 =?utf-8?B?dHdteWJLZW5DUjZwNTdaQkdVSzh1WG1odU5oOG5WV29zUGMvZXU3VEY1cFN1?=
 =?utf-8?B?aEJRdGowS1B5Y0RwZmtmUTNyYmdpY01GeXNIWGovanpWKzlDcC9MSHBjeGpn?=
 =?utf-8?B?cG1TUjk5ZW5ZNTNNRmlpc2Z0L2Z6NHJ0eTlYMVh4djJ3NS9xL0lsTlVCQUhU?=
 =?utf-8?B?M2VvYSs1N0tLVGlrSVVDNVZWYjY4RDNFc2pCVnNWTG5wMVhnZUJKWUJCbzB4?=
 =?utf-8?B?dWJEKzVTV3Nnd3plT2k4NkUxaWk3L3dFc0JMVDZrelNTU0JZZTg5T3Nxd3J4?=
 =?utf-8?B?dGdTVVB2dUFxSXNGNTNoOVJSZitUZk5qYVluTExWUWhaaHVVVmlnRy83MzFi?=
 =?utf-8?Q?0njdgx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5SaVZPeCtjVUNjY3pRUk1vYk1DNk15em9PSDlkYWhITHNQS2QzcTZ2OTV5?=
 =?utf-8?B?QmVKWXlHeXpFV2V1eUxtYVpYcGNVYmx0MkFybmZpbzVUV3F2elB5ZFhGTWt0?=
 =?utf-8?B?bGRKVTBtWm9CRmpxRmhrWDduR3F6OWRrZElYR2Q3YnhsVnIvdlV3dE1RWlVp?=
 =?utf-8?B?WXJjeFUrQlNUc0hIaDJyTXhqRUtlK0RINDNmMWtNSzV5cStweGY3Z0E2Um9n?=
 =?utf-8?B?MnlzdUdWRVM0c1FhSkplM2JQRHUxaXpZR3dWdXRmQjYrNVRNZWx2OFhGUTh5?=
 =?utf-8?B?VUo5bm9lbWZEem0xRFc3K2lsajNQeVpsaE41dHluZlBvZHRzeVJudWVzOTRu?=
 =?utf-8?B?eFNpQTFxUjV5MTAyQUhDcU4zL2VOWFRwY1pvajlDQWVNWnhFekFqaVduMWJw?=
 =?utf-8?B?NVRkWmNpWitvNTU3OWxzWnBLcDBVdXc1bUtpZGY2U09ZVXFyN3c3bk92VGFW?=
 =?utf-8?B?QVZzNkQ5aFg4ZzJ1Q1VkaE9lVm9Ia1BtdWZtalNQeFdQOFRoclNVTjkzcDRL?=
 =?utf-8?B?aUxQVzNXTmJsc1E3VkpKWm95dXFRa0Vqc2hwb0hYMXF1VDBGLy8zSXhjVXRT?=
 =?utf-8?B?QTNudlQxYTAzZW4vN0FxRHIrbmdKRjYxTTYrOGdGSWdRUGhvYjdsbURNempu?=
 =?utf-8?B?NS8zZkQvdkFDTEE3djlLa1lFc3hwbHpKYk5FN1Bma3NGQWJBK0hYQXZYOXlo?=
 =?utf-8?B?S050Vm9ydFRxVWd6REJjcktGbmVuOFRrVUVFd3dQZ2JLR0l3cHZUU2R6cWxF?=
 =?utf-8?B?RmRkd1VSMjhKT0U5dEVOamcxYnBxMXl5UXVHaUU3S2pGdVhEcGlEUVZ6NWMr?=
 =?utf-8?B?aWw1eTRtRDBEMjFuNFNINlpnd2xhYm83SFp1bHErbUdWcHNkaitTYWxrZ01M?=
 =?utf-8?B?RXU5OC9jak4ybGo3OG1ya0ZHS3BueUdtYy9LREZVVlhjUGpTTXpRYnhNaExa?=
 =?utf-8?B?Nm5LRUZOZXFod0piMkN5cE9qeWwzVG5OZkxSbUNEcEtTNkdBVmhLM1BXcjRq?=
 =?utf-8?B?c1RYYjNxQmFUZjhtZHZxRXlmRGxJZnljamhNSnhVdnhFVWhSdmxFQWN1RkF6?=
 =?utf-8?B?SEFhZHgvcUxmSGprUmJCRmE5NFY1QTJ6Nlh3SnpkUzM5Tk5rTXJMMHFkVjhZ?=
 =?utf-8?B?bFBiL0NqaDRVWHRFeG1lOGNpeGVpTHJkWUYwS2FwNUh1dEQ2SDZlVExOY01C?=
 =?utf-8?B?VDRlNXNaL1pDTTRTcFFWSGdBYWc2OGRoL1hOZ0pnS21CTDZTMURJbUtqNjVa?=
 =?utf-8?B?RHNRcU45c081R0hFaGd2dFI0bTM4MGlJT2FZUG5Eakljd1NsR2R0WEx2cmhO?=
 =?utf-8?B?S28zTTNDUlhZTmxqbjhERFBNeEpHcWVSRTlCZWJhYjhNclMrYjIxWUZBNGly?=
 =?utf-8?B?aWZOa3ZQLy9JUzlJOVdaVTduRUZPZjBNSXE0R3VNWXVOUEtsYTF1Z0lWYXFR?=
 =?utf-8?B?STdXSENlUlV6OVRBeFY3UVAxU0FXUGw5MEdMRGZoK01yYXJKdk16SzA2YWRD?=
 =?utf-8?B?V0VVL0xMbkYrcjZrYklkTmpFUURVSWVMTUYrSVNkNG84SDRZM0JTTFhQcjJo?=
 =?utf-8?B?RWJ2TlZQTXlrblJLTUh0NDdlYkpXNDkvTHB4SW1VSHBPeHI3T3VISnEzMzk5?=
 =?utf-8?B?T3FqT2FRZTdjWEZqTFNaRDU1RUVHS1dlZFBNMmlQMHhQajNLNGlaZUhEQmJG?=
 =?utf-8?B?dy9rcXptaWFLS3cxbWFiZjM4WTFSOUlSK1NRYjJScTRlM1NuZUJvdWdESTJI?=
 =?utf-8?B?Wmx2TzlXUEljNnoxMlJCQjRzVGVEY0MzOUgyRDNKQWxkVmZDY0cxQWphNEt1?=
 =?utf-8?B?OXFkTDVZcW55OGM4ck5Cc3BpN3JmSlNvKzlVb2g1cnhpYmdnZjY5QTk1QXQ3?=
 =?utf-8?B?VFRQQWN2aDNnNWFaWGdHQ0h0VGxDR2s2STBkTFdicVZBOC9oQlBTeXpHZVdh?=
 =?utf-8?B?NTI3YkZvOHk4OStOZkJmd0h4VGdVUEM2cHFJYXJXZWw5NTgzbnN6MURvcGhG?=
 =?utf-8?B?aUx1RUVJOGJuU05VakQyOG5sS09oZUlJWW9vZTFWYmVDWXlTMEttUC9mT3hi?=
 =?utf-8?B?VDJ0QkpDTVhuK3RkSFd3Ykdrb1BDQ0cyaFpTbXg3SkszamluK2pNNVNoNGln?=
 =?utf-8?Q?HX9w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc54d9b9-1c2e-4d1b-4580-08de1e40a63e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:00:15.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccBS63vO6pnQzpUHQIiIOh6vD5P1jTJ5BBjbcbB+nCcLsfMkNPymS0A8/ZjQ7spkn4iL87NkjE30426ILjmaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_130019_835450_EF758AF1 
X-CRM114-Status: GOOD (  25.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMDI6Mjk6NDlQTSArMDEwMCwgTWFyY28gQ3JpdmVsbGFy
aSB3cm90ZToKPiBDdXJyZW50bHkgaWYgYSB1c2VyIGVucXVldWVzIGEgd29yayBpdGVtIHVzaW5n
IHNjaGVkdWxlX2RlbGF5ZWRfd29yaygpIHRoZQo+IHVzZWQgd3EgaXMgInN5c3RlbV93cSIgKHBl
ci1jcHUgd3EpIHdoaWxlIHF1ZXVlX2RlbGF5ZWRfd29yaygpIHVzZQo+IFdPUktfQ1BVX1VOQk9V
TkQgKHVzZWQgd2hlbiBhIGNwdSBpcyBub3Qgc3BlY2lmaWVkKS4gVGhlIHNhbWUgYXBwbGllcyB0
bwo+IHNjaGVkdWxlX3dvcmsoKSB0aGF0IGlzIHVzaW5nIHN5c3RlbV93cSBhbmQgcXVldWVfd29y
aygpLCB0aGF0IG1ha2VzIHVzZQo+IGFnYWluIG9mIFdPUktfQ1BVX1VOQk9VTkQuCj4gVGhpcyBs
YWNrIG9mIGNvbnNpc3RlbmN5IGNhbm5vdCBiZSBhZGRyZXNzZWQgd2l0aG91dCByZWZhY3Rvcmlu
ZyB0aGUgQVBJLgo+Cj4gYWxsb2Nfd29ya3F1ZXVlKCkgdHJlYXRzIGFsbCBxdWV1ZXMgYXMgcGVy
LUNQVSBieSBkZWZhdWx0LCB3aGlsZSB1bmJvdW5kCj4gd29ya3F1ZXVlcyBtdXN0IG9wdC1pbiB2
aWEgV1FfVU5CT1VORC4KPgo+IFRoaXMgZGVmYXVsdCBpcyBzdWJvcHRpbWFsOiBtb3N0IHdvcmts
b2FkcyBiZW5lZml0IGZyb20gdW5ib3VuZCBxdWV1ZXMsCj4gYWxsb3dpbmcgdGhlIHNjaGVkdWxl
ciB0byBwbGFjZSB3b3JrZXIgdGhyZWFkcyB3aGVyZSB0aGV54oCZcmUgbmVlZGVkIGFuZAo+IHJl
ZHVjaW5nIG5vaXNlIHdoZW4gQ1BVcyBhcmUgaXNvbGF0ZWQuCj4KPiBUaGlzIGNvbnRpbnVlcyB0
aGUgZWZmb3J0IHRvIHJlZmFjdG9yIHdvcmtxdWV1ZSBBUElzLCB3aGljaCBiZWdhbiB3aXRoCj4g
dGhlIGludHJvZHVjdGlvbiBvZiBuZXcgd29ya3F1ZXVlcyBhbmQgYSBuZXcgYWxsb2Nfd29ya3F1
ZXVlIGZsYWcgaW46Cj4KPiBjb21taXQgMTI4ZWE5ZjZjY2ZiICgid29ya3F1ZXVlOiBBZGQgc3lz
dGVtX3BlcmNwdV93cSBhbmQgc3lzdGVtX2RmbF93cSIpCj4gY29tbWl0IDkzMGMyZWE1NjZhZiAo
IndvcmtxdWV1ZTogQWRkIG5ldyBXUV9QRVJDUFUgZmxhZyIpCj4KPiBUaGlzIGNoYW5nZSBhZGRz
IGEgbmV3IFdRX1BFUkNQVSBmbGFnIHRvIGV4cGxpY2l0bHkgcmVxdWVzdAo+IGFsbG9jX3dvcmtx
dWV1ZSgpIHRvIGJlIHBlci1jcHUgd2hlbiBXUV9VTkJPVU5EIGhhcyBub3QgYmVlbiBzcGVjaWZp
ZWQuCj4KPiBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIFdRX1BFUkNQVSBmbGFnIChlcXVp
dmFsZW50IHRvICFXUV9VTkJPVU5EKSwKPiBhbnkgYWxsb2Nfd29ya3F1ZXVlKCkgY2FsbGVyIHRo
YXQgZG9lc27igJl0IGV4cGxpY2l0bHkgc3BlY2lmeSBXUV9VTkJPVU5ECj4gbXVzdCBub3cgdXNl
IFdRX1BFUkNQVS4KPgo+IE9uY2UgbWlncmF0aW9uIGlzIGNvbXBsZXRlLCBXUV9VTkJPVU5EIGNh
biBiZSByZW1vdmVkIGFuZCB1bmJvdW5kIHdpbGwKPiBiZWNvbWUgdGhlIGltcGxpY2l0IGRlZmF1
bHQuCj4KPiBTdWdnZXN0ZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXJjbyBDcml2ZWxsYXJpIDxtYXJjby5jcml2ZWxsYXJpQHN1c2UuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGQ5NDZkYjc1ZGY3MC4uNTE5Yjk4
YzM3YWM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLmMKPiBAQCAtMjkyNSw3ICsyOTI1LDcgQEAgaW50IGkzY19tYXN0ZXJfcmVn
aXN0ZXIoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ICAJaWYgKHJldCkK
PiAgCQlnb3RvIGVycl9wdXRfZGV2Owo+Cj4gLQltYXN0ZXItPndxID0gYWxsb2Nfd29ya3F1ZXVl
KCIlcyIsIDAsIDAsIGRldl9uYW1lKHBhcmVudCkpOwo+ICsJbWFzdGVyLT53cSA9IGFsbG9jX3dv
cmtxdWV1ZSgiJXMiLCBXUV9QRVJDUFUsIDAsIGRldl9uYW1lKHBhcmVudCkpOwoKTWF5YmUgb2Zm
IHRvcGljLCBJIHRoaW5rIGl0IGlzIG5vdCBuZWNjZXNhcnkgdG8gY3JlYXRlIHdxIGZvciBJQkkg
YXQgYWxsLgppdCBjYW4gZGlyZWN0bHkgdXNlIHN5c3RlbV9iaF93cSwgb3Igb3RoZXIgd3EuCgpG
cmFuawo+ICAJaWYgKCFtYXN0ZXItPndxKSB7Cj4gIAkJcmV0ID0gLUVOT01FTTsKPiAgCQlnb3Rv
IGVycl9wdXRfZGV2Owo+IC0tCj4gMi41MS4xCj4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
