Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBBFEFB6E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ylu8auPPn0ZO0Y8a2W56C2gVYgvU8Syt75C8n7lcHuk=; b=JJ7MGMnFQGmWbE
	68KpgJnTpzjkwlEfGUA7aTwErKg7Lq/OqwY86iXlFibf2voOkSLBCLQwVYMM5WNq4E07YUsjzOvxb
	PMW8RcxXRavnDWRLmM7yBXRe7YNfLs5j3+9eZ+VxOIXjSQoLe73n7LTy5N0+MV89ydioLlC2O2WX9
	vq3jZD3Ezfv5Qi5ZopSbZJns87mENdltGMspuRM5wjhdYQIXLq3vnr55V/S3u0NMZj4hj2rqpONfI
	sFGMk5em0O8gZEdBTPqSqv6cBcS9RERnp95ZNCDd1CZH/3wSizUax/DquH2UuJ9r7WY5Iz8du28Yi
	m2SvluFuLFEVNEM1U6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0b2-00000008j5j-3jJL;
	Fri, 27 Feb 2026 16:21:44 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0b0-00000008j54-3w34
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:21:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2EktlA22vPC/AAVkSybBHTEmvwoBg2rcq74fGEkHrgwlxxpjU8R0tOa6uIF8V3eERRy5BUzA4cXGS+xDWx8YAZt7criILTh/uovjb/JE+BDJCeeyZdRQwBgeGv68Ef8DhkukFGRufuiYrNnhcQFSUJyGj8dy6JNaHX3u8andZ2kx5S8qFAAnXd//XvTS2e3S9GKbDqffbdkT6U86FafG+URTh5HW80K1z1yzjYanXJOX27U1B5d+GivrGmDBgo6y/w4Mnbl2YatqsubiyZ9HV7Ac6ZF5Hq8djxq3KLhW195yrHRFG+Zpz0zz09fSzgqYOmxfaWVOzyJoscOPDBItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rh8WzxQFOIgM5pnWVcTeXXXWy1O1vXhd0X09ddOpkBI=;
 b=hyjXoWmYGtQMiMc7008xQMIWz310FBojnpYaZkRqDSQHglLNwi4ZO5YIE2wuWPbNlDXDXKzBLLrH0juXT7ko5pvBz07zneV0cc+/zYmUdeUyHpIxMn/LTKgD6kdBi0lJgNkJvoQuaLFD3LofSoo3nT8rAxGKBdr/7NtwNl3d4IEs2MrLDEafYEHCNM7N74m1SYBrEH5JBAkUn1ThUXsUaO82xCN22g7NTvuGDjHoBxwaaM6rQMYM2vJjoRenqFEJshXv3ViBjooJqtlKrJ55Fl0ONy0LD+1UEsHzrLuQGlzdkIBagiC/s1/uN1LE8qeuTW0TTlS/Y31uwBbZgSD8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rh8WzxQFOIgM5pnWVcTeXXXWy1O1vXhd0X09ddOpkBI=;
 b=DHLSp40ezuhMCBN1Z57RiBn6Pucn0NH4D7veMdI9bK++69gGHkFDbsatp89TbdhwuicyWuupIjmcNxlt44q/MxTMkApYRAp0LCAZMD9KJRNG2teHSp/0kWLosuBzlo2Cctz9L4q1N1OB6QEfTYoVrf/Rjd9FbpkMOFZ/IsOJXZovFEqp51/qV+WLHe+BQQZRUo/n2bmX96VJfT9yAWPoZAZ9rXu071Civi19nkPRCjklDjvFNNbVHGNEHV2s47sT4o6fw+DpCfAVJ5Mh+ymQqZzGRLUenPhGmVfVuToxsR+u5aM26g621D41BrSB9FZUHZ7BfW7oZymi8X+TwV/GcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:21:38 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:21:37 +0000
Date: Fri, 27 Feb 2026 11:21:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 05/12] i3c: mipi-i3c-hci: Fix race between DMA ring
 dequeue and the interrupt handler
Message-ID: <aaHEjEFsXbbT1P7T@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-6-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0060.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c52d2b9-2659-4ecb-4c95-08de761c484b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: KI1MI2rYRFQHI/eE4REvpAmOLeUcD8/FoOKbXPvD6Fvgs+Ks3xka5fwiqLk3JmTasaQ9onWCL65wLMViP6s5QkX/JsBnwsPfgtMc9LtfSUUiS2AzLIy4CkC1wmZs3o9toyuIIiYgLhEkA+egeGWnlCU/FePcR9yngm5z9oj4aMex8asxWy4lWyfePGrbfoVEAeSJi1SzjRAqu5o3IF0NIw9DlkFRgJMkvf6LMLZihIThH5IDLNVr2eu/2CvsKvqbV6CZvYq4D+ZpR6KP1npuLg1J6qRmKD2JXJcnTvJ0aKwthO6MHZRq6Cs2gi3ibo7mycPbXomvpW2Uc3vG+VYYOG5v4BzVWCGiYtP3kwInny6qJ8F1sVTWgMOXdMN7meaCx4xOjhpPdTpV3macDaNn+yO8UvSJGHAM06muxOj6D5cXrV9jz6/6r2gZSZp7yX0YmT8B0+w2PLEcBFh91IfrtZ9DPLNZlCyKEOTmQbbL0/JjDLHwpBPWFSXysqC+DCIoEM4AXf1Oovwqgr3Leg/L5MdWCZjlFceJ5opWGeDiSE4bfVyxqKbGnczfTG0DFTnPcQ+nHcPwUbmZNcv9NWcupKdZWM0/Ku/sljseu7Gn4pSnhQoUnmCwgbwz22ua0HyvslJ0IXfPtD6dHh0rTMLdTGoQMGCZ1PVjUooey2neKy6wjcfUOy/RNZPURknAKh3qhG+83UVDTl7ZHgkmX513FhY9Y7WBkqF1C7ltjTo8e/kuIZdIOJ+WcpWVylKbWtnsf9c41HfZnJaQ5pIKTZo70JPAh6TKtev/FIK6j5gLhcU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU5pbDBVb2NYNGt5YWtoaWFlUG1POWd4WHpvdjY2eEdYbk41dXlSZWVORVRD?=
 =?utf-8?B?b3RRTXpxdytkVzNkMDFZUm52VHVwVVAwb3Y3dDUvZ3NObUhkWkZCcXlWdnF6?=
 =?utf-8?B?eHpYTnl2R0EvcVhLODdPRks4amR5Z1F5c3lnTmNwNFFZaFFxQUs5NklnVGxY?=
 =?utf-8?B?NXNRMmlYQlRTOWhZS2QvcWxQRHNCYTVmb3U0S3Z4aTlDZmt0aFM4OEpBZlEz?=
 =?utf-8?B?QXJvZkt5eHhMRVB0OVl5RUttUlNNV3d1YmExdCt6RG1xMm93NFdZaDJYeE4v?=
 =?utf-8?B?akM3TythZmtMKzdnZklhSEwvOUJnWk1iNVYxVWNKWEd3Ung5MmdPTERWQ2ox?=
 =?utf-8?B?Z1Bycitjbytkb1lEUEpSa1d5NlBYYndEaUIrdDBuMS9kTkJqRm1ZaVlEaHBY?=
 =?utf-8?B?LzU1Vm9vdThhSG9MNDJSK3hYSkZKcTZHazRlWjdudEFob21GdHJzdjVUU2Zm?=
 =?utf-8?B?UzZ5VGVGd0pDUHRiajNkQjg3Y3hnNUN2amY0RE1aNmJEUmxQSmJRNnB3dVNU?=
 =?utf-8?B?c3VWUGNxSURrY2pabkE4cENNODBvTWtBazBOR25PSkVwNTJxaWJTaDhrWFFQ?=
 =?utf-8?B?S2RtMzJzaWkwRlZMZUlDOHNLN2psK2Rrb2hYNjRJejJzYnN4YnJERmF1aEVP?=
 =?utf-8?B?TFUxSlRRbTlITE5uRzhCYjlNQlRsdHJqbWFFVWhFRXlCWjRWTVVFeEpzVWsr?=
 =?utf-8?B?aTREbWd1RHI4d0hRbUdjR1JScHkxMS9zOEVZZTI4WkpGdE0vSVBTRU93WmU0?=
 =?utf-8?B?UWdnaDVDZXBNSjc1cGkrbEVUSkJZN2RWRlREYXNOektNQjFjNklaWGNxOFIz?=
 =?utf-8?B?YldLZUNBejBQNHNPeWNGUEJ4MUJBRXpmRmRQWSsxdnkrZGxtejFqQkgrUHBD?=
 =?utf-8?B?d3N1TTRIWnpCOFVKL3o4enFOTkw0NTdnWktDTDg1V2xXUlVBdmJ3bkFVMHN1?=
 =?utf-8?B?d3BycUduNjRhZEc4QzNBSG5KVGVnVTNYNHNmbThYNFd1aU42TS9hdDVsMDVI?=
 =?utf-8?B?UDBjR1NYSG5ObFc2U3QyY2Q4QUFuQjNSckRrekp0cFd2dTVGUVlLa2pVWk9R?=
 =?utf-8?B?RDJ3dVFHaHlQVkhxMnduZ2kxVkRPdHQ2TnFpSkY3L3VjOEwxdW1qeUxoNEto?=
 =?utf-8?B?Um9aOWJ1eHNrcTQweEdOMVZzUitrNVAxOXRZU0xxb2RIeGdudDdhQUFTTGJm?=
 =?utf-8?B?TVJOa0dqWTNqTUV1MXY2YW05dXBxQ0ZlNWJjdDlHVVNOYlNxZE1DN0dqN1lX?=
 =?utf-8?B?U1ZkRDZXaTNkajBaVHh5K1grRU85QnBmT3NwNURxNmQyWGZXa2dFbW82RGRG?=
 =?utf-8?B?QmswdWxTa1FDa2JDSThyS3VQcGJEcnJjMTl6bEV2Q3QwVHpmODM5Y1ZtVTQr?=
 =?utf-8?B?MFBSeWM1bWlLNnJYUzZXQk96VlJCdjJadkl4SUN5QW1Xem9MK3Jtb2E2bnVS?=
 =?utf-8?B?NDZYRHdQU2tJenhxaGwrUkFudnp3OEw2OWNDWmw1QTlwR01PaGYxdEJQUWxk?=
 =?utf-8?B?RVE2RUJQZ0lLVC9QaHRWdlozUmw5VHVMVFJRR1luaDlDMVRSVGZxRWJRVUlv?=
 =?utf-8?B?MnVERFJzanQ3SktZcEFBcjJpTnhRVSsvQlN0eWxzTi82Q0RmbXVvdzJMbkZB?=
 =?utf-8?B?RnJGUXkycFVTK1ZpenlISkIzNmhiQUYwblkvVjUyb2k4cEk4T2RSMkltQ0lw?=
 =?utf-8?B?Q3dVTEVKTGNKWWpXMU5VRVp2NXBTdWNuZVBLc1hqRGh4cU9RcU1Nc1VQbTls?=
 =?utf-8?B?TEN2RnI5RUdxVllqODFBaWYxL05BN3YvSnFweTlxbmJWUy9SNFgzMVh6elpx?=
 =?utf-8?B?dFZEclZDaWdjampVc3BwZ21OT2t2TEVBajBVT3VuYnhvdUhLRWxkRUI0cnNN?=
 =?utf-8?B?RlRiUzkzRHIxQXN2MnpuMy83N1JOa1dheXA3ZlM3L0UrM3FVQS9qNCtFT3Nq?=
 =?utf-8?B?cE9CUWJpNUMwbXZWeXB3QVVtaEJZWEhhT0I2SlI0eFplWXp3Y1BwTkN1QzN6?=
 =?utf-8?B?Vm5oeWp3SDY3dW13OHZVYlFJV1FRN2I2VjV3ZlN6ZW90MmJvSzFiLzhYVXFD?=
 =?utf-8?B?QTdtV0QydWdVVUVjZFlSRWIvT2I5LzlOaVVUOEQ1RXZjNSsvbzZ4UkZSbzJk?=
 =?utf-8?B?bnJvcFE5RFdDU2VoK1ZoejdCUW8xbDFXVVVsRTFXSE9pL2FKb0hDK3Yrb3hL?=
 =?utf-8?B?aXo4NmNBMkFaWDQ1Q3FtVm80anUyOVJMbDhURjN2Z2FuNjhaWnV2RklTQmhK?=
 =?utf-8?B?U1IzZEtMOU55alpqQllNaWVtanZsbGtMSjlxajVqL2xUYmkzdkFyVmVUcU1R?=
 =?utf-8?Q?K4PvOwD7ay3icx2nu4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c52d2b9-2659-4ecb-4c95-08de761c484b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:21:37.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArcCtSA2D8CzB3vPMtfDv5NRUVp30/jVoY8+jWL9bbtJ8ICqbznUZJlvYp6VfSWkA7xrWPfVv4cyPksPD5xJcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_082143_016036_81151355 
X-CRM114-Status: GOOD (  23.37  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDQ6MTE6NDJQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBUaGUgRE1BIHJpbmcgYm9va2tlZXBpbmcgaW4gdGhlIE1JUEkgSTNDIEhDSSBkcml2
ZXIgaXMgdXBkYXRlZCBmcm9tIHR3bwo+IGNvbnRleHRzOiB0aGUgRE1BIHJpbmcgZGVxdWV1ZSBw
YXRoIChoY2lfZG1hX2RlcXVldWVfeGZlcigpKSBhbmQgdGhlCj4gaW50ZXJydXB0IGhhbmRsZXIg
KGhjaV9kbWFfeGZlcl9kb25lKCkpLiAgQm90aCBtb2RpZnkgdGhlIHJpbmfigJlzCj4gaW7igJFm
bGlnaHQgdHJhbnNmZXIgc3RhdGUgLSBzcGVjaWZpY2FsbHkgcmgtPnNyY194ZmVyc1tdIGFuZAo+
IHhmZXItPnJpbmdfZW50cnkgLSBidXQgd2l0aG91dCBhbnkgc2VyaWFsaXphdGlvbi4gIFRoaXMg
YWxsb3dzIHRoZSB0d28KPiBwYXRocyB0byByYWNlLCBwb3RlbnRpYWxseSBsZWFkaW5nIHRvIGlu
Y29uc2lzdGVudCByaW5nIHN0YXRlLgo+Cj4gU2VyaWFsaXplIGFjY2VzcyB0byB0aGUgc2hhcmVk
IHJpbmcgc3RhdGUgYnkgZXh0ZW5kaW5nIHRoZSBleGlzdGluZyByaW5nCj4gc3BpbmxvY2sgdG8g
Y292ZXIgdGhlIGRlcXVldWUgcGF0aCBhbmQgdGhlIHJlbGV2YW50IHBhcnRzIG9mIHRoZQo+IGlu
dGVycnVwdCBoYW5kbGVyLiAgSW4gdGhlIGludGVycnVwdCBoYW5kbGVyLCBjbGVhciB0aGUgY29t
cGxldGVkIGVudHJ5IGluCj4gc3JjX3hmZXJzW10gc28gaXQgY2Fubm90IGJlIG1hdGNoZWQgb3Ig
Y29tcGxldGVkIGFnYWluLgo+Cj4gRmluYWxseSwgcGxhY2UgdGhlIHJpbmcgcmVzdGFydCBzZXF1
ZW5jZSB1bmRlciB0aGUgc2FtZSBsb2NrIGluCj4gaGNpX2RtYV9kZXF1ZXVlX3hmZXIoKSB0byBh
dm9pZCBjb25jdXJyZW50IGVucXVldWUgb3IgY29tcGxldGlvbgo+IG9wZXJhdGlvbnMgd2hpbGUg
dGhlIHJpbmcgc3RhdGUgaXMgYmVpbmcgbW9kaWZpZWQuCj4KPiBGaXhlczogOWFkOWE1MmNjZTI4
MiAoImkzYy9tYXN0ZXI6IGludHJvZHVjZSB0aGUgbWlwaS1pM2MtaGNpIGRyaXZlciIpCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxh
ZHJpYW4uaHVudGVyQGludGVsLmNvbT4KPiAtLS0KUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFu
ay5MaUBueHAuY29tPgo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RtYS5jIHwg
OSArKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2Rt
YS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kbWEuYwo+IGluZGV4IDVhOWFm
NTYxZTRjYi4uOGQ1ZjgwOGUwM2VhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9t
aXBpLWkzYy1oY2kvZG1hLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2RtYS5jCj4gQEAgLTU2NCw2ICs1NjQsOCBAQCBzdGF0aWMgYm9vbCBoY2lfZG1hX2RlcXVldWVf
eGZlcihzdHJ1Y3QgaTNjX2hjaSAqaGNpLAo+ICAJCVdBUk5fT04oMSk7Cj4gIAl9Cj4KPiArCXNw
aW5fbG9ja19pcnEoJnJoLT5sb2NrKTsKPiArCj4gIAlmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKSB7
Cj4gIAkJc3RydWN0IGhjaV94ZmVyICp4ZmVyID0geGZlcl9saXN0ICsgaTsKPiAgCQlpbnQgaWR4
ID0geGZlci0+cmluZ19lbnRyeTsKPiBAQCAtNTk3LDYgKzU5OSw4IEBAIHN0YXRpYyBib29sIGhj
aV9kbWFfZGVxdWV1ZV94ZmVyKHN0cnVjdCBpM2NfaGNpICpoY2ksCj4gIAkvKiByZXN0YXJ0IHRo
ZSByaW5nICovCj4gIAlyaF9yZWdfd3JpdGUoUklOR19DT05UUk9MLCBSSU5HX0NUUkxfRU5BQkxF
KTsKPgo+ICsJc3Bpbl91bmxvY2tfaXJxKCZyaC0+bG9jayk7Cj4gKwo+ICAJcmV0dXJuIGRpZF91
bnF1ZXVlOwo+ICB9Cj4KPiBAQCAtNjA3LDYgKzYxMSw4IEBAIHN0YXRpYyB2b2lkIGhjaV9kbWFf
eGZlcl9kb25lKHN0cnVjdCBpM2NfaGNpICpoY2ksIHN0cnVjdCBoY2lfcmhfZGF0YSAqcmgpCj4g
IAl1bnNpZ25lZCBpbnQgZG9uZV9jbnQgPSAwOwo+ICAJc3RydWN0IGhjaV94ZmVyICp4ZmVyOwo+
Cj4gKwlzcGluX2xvY2soJnJoLT5sb2NrKTsKPiArCj4gIAlmb3IgKDs7KSB7Cj4gIAkJb3AyX3Zh
bCA9IHJoX3JlZ19yZWFkKFJJTkdfT1BFUkFUSU9OMik7Cj4gIAkJaWYgKGRvbmVfcHRyID09IEZJ
RUxEX0dFVChSSU5HX09QMl9DUl9ERVFfUFRSLCBvcDJfdmFsKSkKPiBAQCAtNjIyLDYgKzYyOCw3
IEBAIHN0YXRpYyB2b2lkIGhjaV9kbWFfeGZlcl9kb25lKHN0cnVjdCBpM2NfaGNpICpoY2ksIHN0
cnVjdCBoY2lfcmhfZGF0YSAqcmgpCj4gIAkJCWRldl9kYmcoJmhjaS0+bWFzdGVyLmRldiwgIm9y
cGhhbmVkIHJpbmcgZW50cnkiKTsKPiAgCQl9IGVsc2Ugewo+ICAJCQloY2lfZG1hX3VubWFwX3hm
ZXIoaGNpLCB4ZmVyLCAxKTsKPiArCQkJcmgtPnNyY194ZmVyc1tkb25lX3B0cl0gPSBOVUxMOwo+
ICAJCQl4ZmVyLT5yaW5nX2VudHJ5ID0gLTE7Cj4gIAkJCXhmZXItPnJlc3BvbnNlID0gcmVzcDsK
PiAgCQkJaWYgKHRpZCAhPSB4ZmVyLT5jbWRfdGlkKSB7Cj4gQEAgLTYzOSw4ICs2NDYsNiBAQCBz
dGF0aWMgdm9pZCBoY2lfZG1hX3hmZXJfZG9uZShzdHJ1Y3QgaTNjX2hjaSAqaGNpLCBzdHJ1Y3Qg
aGNpX3JoX2RhdGEgKnJoKQo+ICAJCWRvbmVfY250ICs9IDE7Cj4gIAl9Cj4KPiAtCS8qIHRha2Ug
Y2FyZSB0byB1cGRhdGUgdGhlIHNvZnR3YXJlIGRlcXVldWUgcG9pbnRlciBhdG9taWNhbGx5ICov
Cj4gLQlzcGluX2xvY2soJnJoLT5sb2NrKTsKPiAgCXJoLT54ZmVyX3NwYWNlICs9IGRvbmVfY250
Owo+ICAJb3AxX3ZhbCA9IHJoX3JlZ19yZWFkKFJJTkdfT1BFUkFUSU9OMSk7Cj4gIAlvcDFfdmFs
ICY9IH5SSU5HX09QMV9DUl9TV19ERVFfUFRSOwo+IC0tCj4gMi41MS4wCj4KPgo+IC0tCj4gbGlu
dXgtaTNjIG1haWxpbmcgbGlzdAo+IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
