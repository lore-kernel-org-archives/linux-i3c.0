Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F6C7EE30
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGE4N9lBboXtlVsBgpI4wKttUNLFHLbrKIsEUKf663w=; b=SDDoSu+XE6zy2K
	z1/e7p1T677XyqvEUaKIy02IlSdvOL4jaP9h88uzMD0SvlUFeXbR9pkBCR5Et1vGUiCo8jIlkZMe2
	7acdiny7VoNZjvWunpMCKmf3747hdBZzF+phdjVf4Y8iMwMCLhI5IBU59fw6leF8KklY0AaCuaea5
	UnUBoN9EGZ20BbzaRFA7QNNlp7pURzeWIqSPiD3/asaZ2i4Hx/oAtMzLLAEZQzoLa0N4b2jOlf0bY
	2atZf6XkO9+wuSIhWsyzHFrI8VQSrjtDdoPjJTYLvuNCOGiN9gptAogaswQt8ap1FEvIznfNYpnEf
	LHWuP3wpz2MLPqYlCtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqYu-0000000CNic-1AlC;
	Thu, 26 Jun 2025 17:39:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpDr-0000000CEXB-0v34
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 16:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPja3YdlVddDCgbdAe/Vzy+n5veFK/llsZgS7qTlIPspTwg8iD3K8eF3yVWvQ6oLYSt0Is/gVAEsLi9NnpN6WullJ6encQutP9GLSASCmqLR5rf7x9hzWsC+DP1TRy2wvE3gZ7IcH38qnSbXZfsId9jx1/EJq6JQl4d4dvN6XUNx1HsFsGLSpEZI1OdnHTbG9AhpvbYstwxKOVB+IV3uCMzzk5cZnnSxTqIot6Dea8GZEjYpvCiGJCKxMxs4b+o7RWNK0OS9Qdl0dZN7ms0DCgx/IbiPclO0oRiIHvhA3nD8jQ1dlMPb3tBY79n1hMAVu8+u+6o24kywvd0uuIOIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFSqXN0lqV6OFG/uZimakcZqruxVNRE53rDfkgq1kM0=;
 b=KpAqgslM8jSgy8pS+7xVEvRMfH+GKPC/dSAt1Ozcyi+YsrbYkHFal3Q63R9RH5Aq4bCrQMGC7SbyW1IKni65XkdvmFW3CcVKu/DpS9uRzVd3ksKNp2jJrYQTiEatrVMpBGSUxhso/dYq83CEaoC8AAkdxdUUqgmICNnGOvvdF/6/c9WTr5upsRsHt7sCTetgFvp+e+C6FJ5TozZXI4NWbrmIku6f9dUk7fwwbzTecoNxel8so5Kiqqk6FL7TS1vQeh/hOoWL1rheClkMfvoUXf8pNQZk8mN2VrQPFIxCrwHDjMN9YKq+JVB0+LseoLmkcVMCPJw6uFiAp6mQ4kTj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFSqXN0lqV6OFG/uZimakcZqruxVNRE53rDfkgq1kM0=;
 b=Wn8g2yTLKZSiwCSUr8Gp836611BowR9sZ7lH5zACTM1nzC/HPAhAACvUTQmJ8eJ8W8P7qYiJOQY6njvTVTWBqlf095oKLwJ3j9mhCnkKFFwQ1Ugu5lJVHxzuAbnxGW8LJbeLInabx05ukDrrgFR8rL6FsdbkWQ/y2Z3VwgaNaWCWZqTfirm6/DW/rA7/u6EtjaSYJTMoSnVheUyPCp1xEd2ScWUolpWNBSYjSdC8JOByL9sX2mLh4XJY1Os8bG7Smw89g04BhrAGxfSNr7ZlFzVsvTJEYErtfq+vz5KjbRkEE/RsiYhKVi2kIH3zt+lNn54ctKZfLSac4iBuhPY86w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8306.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 16:13:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:13:08 +0000
Date: Thu, 26 Jun 2025 12:13:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aF1xj9lSPSbYybz/@lizhi-Precision-Tower-5810>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
Content-Disposition: inline
In-Reply-To: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: f85fa469-1813-490e-9a22-08ddb4cc56ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEQ0WjdRTWx0Z1crOTB3LzJabENmVHBYN1diSWRaczFlNisyZGx0WHJmZDYr?=
 =?utf-8?B?dnllczJhdlo5TU9ESENCSi9nVlJyNXVVWkdmR0tlMjIyNDhLSFFRRXNYeFNH?=
 =?utf-8?B?SVorMjU3MHZWQzllbUlta1NwZWhWQlpoS2VRRWYyRTdTR2V4aHVMblBXd2cv?=
 =?utf-8?B?MzM2S05KdnFYc2pwTGFka0FGY1F6RnIxekdoRDRqOGFEMkxhZmgrQmVhZ1Rt?=
 =?utf-8?B?NFJuK3BiNmVWQXRlR0VVN0hXekpIYkFTVmtoRndsZ3pIV1Iwa003UmpWeVdP?=
 =?utf-8?B?SXEzOEZrdDlUT2Y5Y3BNUk14M3RhS08xU1ZSQzB0OFhQR2pSSnNIcXlISnd2?=
 =?utf-8?B?TEJhTzlENkJDekUxWkRMKzR0dWhFbnhsNU1jUWxpd3gwajZqL2NVMDdwb2Fq?=
 =?utf-8?B?QlBpWkFMYVFzT2NvVkNFak9NN01CQUJnODhUMkhyUXVTd0hrUFpXYTh6MFZ5?=
 =?utf-8?B?S3FyMGhvV2tMYkhyVDNFT1ZVbmxod3d5cFg4TERhUmhoa2tKM3htYjg1VDNT?=
 =?utf-8?B?SkdZcjZKRTBIKzlyMWt5VVltV0tocVIzOWtUZ1BQbWhDYjdoYXNHZWhNeG53?=
 =?utf-8?B?YlJSRnlLTmRzcVZ4ZmJTS3Zpa0RkQ1M0UVdJNFFyN2hONjd4ajc1R3BtcUpE?=
 =?utf-8?B?Ujk1UzB6cXlwTjh4em5YaFMxMmcxTzNDekxEQVM4UTFSMzhoRWp2TlMwbFph?=
 =?utf-8?B?aVNmdThDeGVDSXNiTVBHZWpneHRHRGEyaFY4QjA0aTdPSlB6bURabytOZkFF?=
 =?utf-8?B?NVpDOHdWRGErM2paUFhxalR5QzF1S29jRUF1ZEkvVEpHTmk2Y0tBMXlkb29Z?=
 =?utf-8?B?b3MyQmNIY3Z1NStYWElCZlNacUpnUndJMDNKZEFiTlo1RllKWDBKT0RJaDFj?=
 =?utf-8?B?dTlVcXhVMGxmam8weHVtTHRkNW9yRFBkNHp5aU43b1VXOVFMUmZSdzJhR25z?=
 =?utf-8?B?TlUrZlNCWDhGNXc1RW5aZXRyM3RkMXg2MWNERm5EakRLV0RlN3BqNnRxcmVR?=
 =?utf-8?B?a2JUek01Rm12bjBXUGl4WnYzOE1kR045ZkdSby9kMHozVnB2T2NQS3Yvc2w3?=
 =?utf-8?B?bFovdXh3TUt6QlFwUmpTMXpTNWhMZzR1RStqOU95bWFWUDN5OHNyOFRqUDN2?=
 =?utf-8?B?dnhuS090UFlqSjBNL3VJYzgwVUhmM0NJZnppRkFwMHdCMFVMWFp6cWxEc2M5?=
 =?utf-8?B?WHVkalVsc2tSaEI3emhuWVR4Tko5aHYzMjJzNzcwSURubkV3M0xIL1RtM3pu?=
 =?utf-8?B?ekVXYk1WYlVlM2Z6NXFlNTc3M3d2WjF1Z0tqNlVQS0JvT1FDQWxBQlozTTVB?=
 =?utf-8?B?WkNQcTBGN3I1N01NeXFKRnY3WURuTWdSK2lscjM3VmZWWjZXWkN6MlBybG9V?=
 =?utf-8?B?bVNrU2hjSUgvaUZ0cnBNTUJhTGpMMU5nNkUxQ3o1NnJJMHFyMng3cUJSZFZk?=
 =?utf-8?B?NHpnNEIwS3RxNlVsQjIybkRUekIyWVl1bW9KU3cyU2srRTFMaWFPQnFCT2J5?=
 =?utf-8?B?QWdwQXM4TlBIMDFQQjFkTGtvblBYSnVuQ2Y1clZlQjJ3K2VCQnpNVHFESWxh?=
 =?utf-8?B?QlhWWTQ5aGR4aWFwYWxTdzlqQ2lIb3NVb01ROFc3ZmJnanIvclByS00vbHlh?=
 =?utf-8?B?OURORm41RzdOUnl1VzBxYTNxTjltQ1RKYStPTW1vLzVRRVQyQnRIcEpIdmMv?=
 =?utf-8?B?SXRCVWFGMmd6NitJd25QVGd1SjhvYU02NmtwQVdvSzZCMTBKa0hnMjF3QThB?=
 =?utf-8?B?akdxVGJKRG1JV3BSbnJFWHVOZjdlTVlaNkZadU5xdnBYWGNob1MraDF6YkRs?=
 =?utf-8?B?enB1eWMyR0VOQ0FSblZJeHpHUmdWaEtJNmtXQUZCL3RJRENtRmF5WEF0cFRa?=
 =?utf-8?B?NU5qZ2ZVbnhPZGtBd3BONHZQKzJVZkIzK2xpNGw3WjZqemxqb002Zy9FQ2tO?=
 =?utf-8?Q?jnJMTHgmseb8q+a1o6inJy1a1TiiByS+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdKcGJKTmYyWkJlK3ZremZSSmo2YlhkWXZkU3dVQUNnNGR2dTkvRFdSYi81?=
 =?utf-8?B?RnFFYnZ0dnZDb2JTNUJ4dHJ2QUVpSEZEbVJxTzJEYmpJV0RVaDlSWEF3S2g5?=
 =?utf-8?B?eVNid0cyQnhXdG55V2l4dG85OWpodGJJZTk2NmRDaGFXWVA2RHI2eFVFM2M0?=
 =?utf-8?B?WHV1MVBHRzJEQk13YjhoZ1lQQVFETWtkaFVYclp3L1QxRklwN3pKa3VOWUo1?=
 =?utf-8?B?SE00VG9wQmE3NGxOS0RkZ1R5cThVaEt4Q0Y4d1JmNlRKTk1oYUhSaXpZMW9r?=
 =?utf-8?B?RUMzYlR6RXYzalppZG05K1lwcTYvL2x0RnZzbjJrODZRUUxHWnVwdXV6NFpi?=
 =?utf-8?B?SkhidC8yRlFzYXl1ZURsNXF0UnRHVEZ1b2cvckYzSm9Pd2d4ZkJtT2dBSUZ1?=
 =?utf-8?B?RFpvV3dqR0o1TlhJQ3lqSldiRjNLZHYrdFoveGxNZzZ4dUZyYUlVekhnZitL?=
 =?utf-8?B?cVg1L1VyalkzMUlsV1hNbDY0Z0pVNFFpaXlIbUQvdm44cDdCcSsrb1RFblQw?=
 =?utf-8?B?eVlHU0FVQXpGeWtxSFlmbEVtZkxRS3V4M25tOTd1RTNUNldiN0grUHhFbDc0?=
 =?utf-8?B?aE05Z1VDSHJuZzI3WGZlWTIycFkvSC9oMFo2SmZFZE1nZzY0R2tYTlpLUHRm?=
 =?utf-8?B?Z2hVTC9KWGgrdjE5bGVvWGloZTNlVDkySG0va2FmNFZKbkNRZElDd0o4eWRy?=
 =?utf-8?B?VFZ6K3BqZHZyWmJxU0NjYVpnc2p0VkdKbk1FWmN6K1BqTVp3N2JCckNJdlFv?=
 =?utf-8?B?dFZDclRuVmlUaFpmYjNjejVjZjVZWnE5dnNwWkVEcUUzWGFZN2RZU0lpSCtr?=
 =?utf-8?B?MWFsNkp3bCtod1J2QTdiYW5yS3AveExBQUxlczRCRDVnczhHQTNKOWZhNW9i?=
 =?utf-8?B?RzhnOTNSNHZkTGM0V2xGa2d0Qko1NVYraENzdGtvb3hCRGVDTEtUOGR2WGFZ?=
 =?utf-8?B?SHlkSGM3WDltbFpUVU9FOTdDQ1FUWHM2WGVTWnNZZTk2VDBIc1l3dFo1dUxn?=
 =?utf-8?B?MG81ZENtYUdWTlNFYVQ5bWF2c2RIVm1OWW5VQ1lmNHdOQlJ0a25QRS9MRmVt?=
 =?utf-8?B?anJYSDRhWWxFeUp1aEt4MkZEYVFjNDU1KzUwRWl1czVLOC9PL0g5cUcwWUhY?=
 =?utf-8?B?RlVBSXJzYnQ1cUc3WUJmeTJNSEZkL2oyanZqYnE4MU5aTC9kU0ZLcDAxMDJx?=
 =?utf-8?B?Q0xjdExEbGp4RE4xL21DQzdrbjFQd0pIdmwxNnNVcVVBNThyamt2U0xJbzRi?=
 =?utf-8?B?ZWI4c0NzL0VDVitTRmE3L3llUXZxcHlteElQNHdCRDhMaHAyZlZmcHhweVpr?=
 =?utf-8?B?UG12dUJBSm82UjJCbGU3eXI2NG11dzBHeFZ0ZGNmMitpeXNrRVlpOTJGZ2oz?=
 =?utf-8?B?Z2JQdUtnRzNjVEtFb042eUYvaWNLTDFYSjdsOHNjSWx6Ly9GcnNSSkk2TmJV?=
 =?utf-8?B?TzYvb1VrZVlMbHpZWGN5cXJuQ1I0Qi9tYkRoSGFKaENYbGw1aUIydHkwSzdp?=
 =?utf-8?B?dG5abC92S3BCYWIwN2F2WEdBbTJRbzV0U1lJd0lZZElMRU5DbVdvOVFoZDVY?=
 =?utf-8?B?eDBuNGM0Q2xudTlPQ1RoamxoN2svdUFna2lhTGVtOVNYODhvelBjWEl3Wkdw?=
 =?utf-8?B?WkxVNVczUWlCR2pSd3VaVEllVGJDSUM0dlg1TzdWSG5iZVA1ekY1bGZ6cGQ2?=
 =?utf-8?B?TmhqdVloMVI2NTZtUng3dmxmaGdLNXk4a2JoTVZkWDQ2K0p4SzhnRmtKUU1x?=
 =?utf-8?B?ejFZM2xoaDJBTU1IS2JHYitFNldIT1FmMnBZQzNqcVMzb0xUY1FCSXpZMVVZ?=
 =?utf-8?B?YkZ3RWtNNkFrNWVYU2R6YVA0NGNmQmxXS1ArV1BaSHBQQ3lOUVBic21FQTRr?=
 =?utf-8?B?SmRTOEd6cDNBZ21BazZpTGxYQk5lakFFenJmTkNwYlBLdmxQVDF5Ykwzb2F6?=
 =?utf-8?B?WmNSOVlVRW5qd1FEanRiZVU3eWNnUUxqb3FsclNtTkNZUWVpbGdUTFRnVi9U?=
 =?utf-8?B?NXdtY1ZUWVgvZ2JjYXhDRjgrWTZFR3k2T1Uvc1J1L1ZTZnlEZFFOdGlKZURa?=
 =?utf-8?B?aFhyTU5XVnZlb25VczRKdmFMT0tZb0hHRFNnOE1jdU5wYkxEMmJjM2xySmI5?=
 =?utf-8?Q?84IazdPJB7fTN8/g11ziPGXPL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85fa469-1813-490e-9a22-08ddb4cc56ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:13:08.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZvE4DBH7plnAO1kevmXsYZCz2s3hZacrfJc1NCZt0fpjdQFNCOf2VR12In398rjaAo6tMkvbmuP7v1XSs9vCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_091311_273903_B7405E47 
X-CRM114-Status: GOOD (  18.82  )
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

T24gVGh1LCBKdW4gMjYsIDIwMjUgYXQgMTI6MDc6MzZQTSArMDIwMCwgSm9yZ2UgTWFycXVlcyB3
cm90ZToKPiBBZGQgYmluZGluZ3MgZG9jIGZvciBBREkgSTNDIENvbnRyb2xsZXIgSVAgY29yZSwg
YSBGUEdBIHN5bnRoZXNpemFibGUgSVAKPiBjb3JlIHRoYXQgaW1wbGVtZW50cyB0aGUgTUlQSSBJ
M0MgQmFzaWMgY29udHJvbGxlciBzcGVjaWZpY2F0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9y
Z2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKPiAgLi4uL2JpbmRpbmdzL2kzYy9hZGksaTNj
LW1hc3Rlci0xLjAwLmEueWFtbCAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrKysrCj4g
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUg
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci0xLjAw
LmEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXItMS4wMC5hLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjliYWQyNDE4NzgwMGNiNDcwOTBmNDQw
YjcwYzUxOWIzZjcxMGFkZjIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci0xLjAwLmEueWFtbAo+IEBAIC0w
LDAgKzEsNjYgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvaTNjL2FkaSxpM2MtbWFzdGVyLTEuMDAuYS55YW1sIwo+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3Rp
dGxlOiBBbmFsb2cgRGV2aWNlcyBJM0MgQ29udHJvbGxlcgo+ICsKPiArZGVzY3JpcHRpb246IHwK
PiArICBGUEdBLWJhc2VkIEkzQyBjb250cm9sbGVyIGRlc2lnbmVkIHRvIGludGVyZmFjZSB3aXRo
IEkzQyBhbmQgSTJDIHBlcmlwaGVyYWxzLAo+ICsgIGltcGxlbWVudGluZyBhIHN1YnNldCBvZiB0
aGUgSTNDLWJhc2ljIHNwZWNpZmljYXRpb24uCj4gKwo+ICsgIGh0dHBzOi8vYW5hbG9nZGV2aWNl
c2luYy5naXRodWIuaW8vaGRsL2xpYnJhcnkvaTNjX2NvbnRyb2xsZXIKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgo+ICsK
PiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFkaSxpM2MtbWFz
dGVyLTEuMDAuYQo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9j
a3M6Cj4gKyAgICBtaW5JdGVtczogMQo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IFRoZSBBWEkgaW50ZXJjb25uZWN0IGNsb2NrLCBkcml2ZXMgdGhlIHJlZ2lzdGVyIG1hcC4K
PiArICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEkzQyBjb250cm9sbGVyIGNsb2NrLiBBWEkgY2xv
Y2sgZHJpdmVzIGFsbCBsb2dpYyBpZiBub3QgcHJvdmlkZWQuCj4gKwo+ICsgIGNsb2NrLW5hbWVz
Ogo+ICsgICAgbWluSXRlbXM6IDEKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBheGkK
PiArICAgICAgLSBjb25zdDogaTNjCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVt
czogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAt
IGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMKPiArICAtIGludGVycnVwdHMKPiArCj4gK2FsbE9m
Ogo+ICsgIC0gJHJlZjogaTNjLnlhbWwjCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZh
bHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiArCj4gKyAgICBpM2NANDRhMDAwMDAgewo+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXItMS4wMC5hIjsKPiArICAgICAg
ICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8MyBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArICAgICAgICBjbG9ja3MgPSA8JmNsa2MgMTU+LCA8JmNs
a2MgMTU+Owo+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJpM2MiOwo+ICsgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDM+Owo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsK
PiArICAgICAgICAvKiBJM0MgYW5kIEkyQyBkZXZpY2VzICovCj4gKyAgICB9Owo+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggOTZiODI3MDQ5NTAxODRiZDcx
NjIzZmY0MWZjNGRmMzFlNGM3ZmU4Ny4uNmY1NmUxN2RjZWNmOTAyYzY4MTI4MjdjMWVjM2UwNjdj
NjVlOTg5NCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4g
QEAgLTExMjQzLDYgKzExMjQzLDExIEBAIFM6CU1haW50YWluZWQKPiAgRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hc3BlZWQsYXN0MjYwMC1pM2MueWFtbAo+ICBGOglk
cml2ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKPgo+ICtJM0MgRFJJVkVSIEZP
UiBBTkFMT0cgREVWSUNFUyBJM0MgQ09OVFJPTExFUiBJUAo+ICtNOglKb3JnZSBNYXJxdWVzIDxq
b3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gK1M6CU1haW50YWluZWQKPiArRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCj4gKwo+ICBJ
M0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBNQVNURVIgSVAKPiAgTToJUHJ6ZW15c8WCYXcgR2Fq
IDxwZ2FqQGNhZGVuY2UuY29tPgo+ICBTOglNYWludGFpbmVkCj4KPiAtLQo+IDIuNDkuMAo+Cj4K
PiAtLQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
