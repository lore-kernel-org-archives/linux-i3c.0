Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C85CAC5A5
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1ZCwhPKaV/XobgLm8EEUhidwb4+vwoR5w/GukQ2/dk=; b=vfBzQTgzJgCtKZ
	IPQmzFb5YIfvLR4f5IocqGS2A6vtEYYeniSPBqB5gacEeqo2MNyjqQ2Nt9Ul9TGSBwrXdBw9OdLm+
	5/slrB0D3B8M99qPO45JEpSXwk422ccl2XjGU+XfHNiBc4z73MaVppBOo4jugo4hRWt3Ko5Uto5XT
	DtsMNzviio1Y+M8OG1NMi6S9p91f6TykCENdbZ9im4Uts4ltr//LL9lgf5jbiP57eyaB03FOErYhC
	P07+kTmyN3ug3jl9kxbIHI4/cIx/fqddk4U0UI0YTlGLIqxk8IP64i4GV4mvRq9z3HThjC5hpU9oz
	Hzpnjnda9kyWgT7GCIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17zv-0000000EZ1o-1r1e;
	Tue, 23 Sep 2025 18:44:19 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17zs-0000000EZ1H-3xJe
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 18:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr70iqNSFoTqkyc5CSf+7lu/XdKzUSQtEne9zAr/gJiG1nFaNvPPrw7N2tdiqIlhrH2CngZCyG4QGnBOV9AL/XgT8IxeFpZL3PEExWw35CvuSmo24sTy+E06Th6zuv1bY1qHe6ihyyYfFKoHOF8IJWXlZP6GWzRCo/Xnmi4KDLo5LweR6XWuU1uWdON3N6QybbJ75/VBOuymIlsm2GfrdhYf8HTdCrCX2Eq+V6P/Kg08dKFbihKbih2O0lYwaHejgpFkSfTM1EjOiNwodDMvHeMmnAZSo8xVuqJYot4P34JsD40QRPdD4k/Ezcm51FrEJiVNor7JJ1yYc2F2pc/qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQuH6xgNKFl64dJ8ap/O8xRTPBKQvjsAjgHG/MRoRxM=;
 b=VDe6MMD9y8BPyrgqZQ/25xW1C3ORhZxfByfaxvPCw8BzAcwHiDiris2W8lipYZQtEV2R1/cqiwy9jTV+ux0bkeU1PauG8+RIH/X/et0kynY8s94TgdMN2OIwjn9O+yE3/DacGBS5z2pbzthus9hEfo8M8/xoPSyqHwrRtfu16HvBmr0ZurFvF2fbIuc4bDIMEIKD8R0kLZtEX+0uwrijquqvZK+AMWC/GSLU3NYi9deVhaouub4fY0/Ve6okskb392o0t76h5TKOf+HBU3NGRiuixocYdgrA3MpiBioOHYQsvIaWZRNoB/UTjwyPN0+BDs6skWfHjQ45ilr1u5q5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQuH6xgNKFl64dJ8ap/O8xRTPBKQvjsAjgHG/MRoRxM=;
 b=f8yn9ZUQJpAESILnSMcze1ykI+/nlPpiJqj4L7aZFDkBLz0L2E4Fg38u2NODLMIzyO9OMYGH8YZnVRqdjEdAI5kNw76l5AH3shOGFUlHTA4AjGWCckbAl3yy1dC1bTczDMfgIcOwXX8JSfB+/3l5hc4LSkarv3XIMy+IYX9GkdMToQNpunE9Rniotjx0YqNglqQrU3XQkaKQ9O714+IKtVFYGsg7+hYqQTCmIDoEQSzPHDcMkKMDiP/tuAPqDelysy4lv9FZhXISpheOPChm3H5f7v63RZ1Exk3ow0WY+qbarJe1UCjQP7n+E+oX1qeUI629AZa0ARplftD8ZsDNUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB10473.eurprd04.prod.outlook.com (2603:10a6:150:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 18:44:05 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:44:05 +0000
Date: Tue, 23 Sep 2025 14:43:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pgaj@cadence.com, wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com, arnd@arndb.de,
	quic_msavaliy@quicinc.com, Shyam-sundar.S-k@amd.com,
	sakari.ailus@linux.intel.com, billy_tsai@aspeedtech.com,
	kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, jorge.marques@analog.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
Message-ID: <aNLqa4poPkkvASbq@lizhi-Precision-Tower-5810>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
Content-Disposition: inline
In-Reply-To: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB10473:EE_
X-MS-Office365-Filtering-Correlation-Id: 96641ce8-35ce-4294-3f61-08ddfad12c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekRLMnhQRWI4T01hN2FXSTA5aHFHdHAyR1Y1M0MzT1BUTFh1RE11OVdUazdZ?=
 =?utf-8?B?NnRRZDlGWFc0Ui85OVg1NHpsT3A5UERYUTJiSDg3alB6U1NlbXgvN0R6Rjl0?=
 =?utf-8?B?U3JpcXVnUC9vWVhPeS9TVUdDaUliOVFUaHNtUFUxdm9Fb0J0K2dDYWR3a1dO?=
 =?utf-8?B?cm45eVhSRjZRaGNZbkV4VnBuRWlxWFZJUk5VaUZRWDJvUUdLNmJGUDROOEZC?=
 =?utf-8?B?WHpzSE9ibHVmRXdHYTZoeU96Y3AwanN6cHdQQTVyN3YxR0ZEMEMvVzhuL3VV?=
 =?utf-8?B?UG1RZHhxOHpka21LbjNxUW0rbmlVL2REMDVIRkVKcU83VTFXOUtoN2FSa3lG?=
 =?utf-8?B?ZnI3ajloTDlMbzFHQW4wUkV0Zy9YRkRWVXFBeXlSVUorQ24yMXgzbVlCemFY?=
 =?utf-8?B?cUVhY2Z3TVhTZC9hY2tqKy96V0xPRTZ3WWRuYnE0bGRPcnFIczhoUjRBdWdD?=
 =?utf-8?B?aFpMNUpCQ1ZmZFBqQ2VxZ1lxMURWakI0UWRBbTRvT3JwTzdqVFRySzBvaXZs?=
 =?utf-8?B?ZmtvVWE5VVhZMS8wcVNaWWdmbEtPNUp1TU15akFPYmt1dHcxLzJqcjU1Rk10?=
 =?utf-8?B?MHY4eHVGN0daZVNMSHlnNDZPa2pxM3dxaGJ4NkEvUlZiOE9UT3Fady9sOGc5?=
 =?utf-8?B?MmhZTDdEOUl5WFV3a1VhaUVmOUVsRGlRUnNOamROb3FVb3pNYkt2N0dGNGRG?=
 =?utf-8?B?RkM5amFoNnRyd0FWR2J5Q2N3ZUJpMm1WRzBJUDZjcmhBcHlabUpVdDRlZmk0?=
 =?utf-8?B?NFlFS3RNSjQ5dU9yQ2lYTmZkSDE0bmdGM213Wk9UanZlSWV4TDJZVHFOMjJo?=
 =?utf-8?B?QXZXMFB3SEs1ZnZVd2paSDcxbEkxemwreWZYTXExRjdMS2kzK0pVS1JEdnRw?=
 =?utf-8?B?eEVQejZJTjRXL0o1OVpKY3ppOXVqSDdQOHA4eE1MMjR2blhhVk1VZkx1R3k2?=
 =?utf-8?B?K1prVTdaQ2VKSFB4M0ZBR05HSnZxTjIxUGRjSWVnYVMvMTVFN2o0eHBQNUt4?=
 =?utf-8?B?L2lGMHRIRDN5bGVKUEYyc245aWFLOHNualJjYkgzZ2FLWmwzUi81MTAzQzhW?=
 =?utf-8?B?b0ZDKzZQYlBob3Vna0p1TTFLYUM5MWtOR2Jsc1dhNVFJTDR6a1VjVmE5YWNn?=
 =?utf-8?B?UjlaMTVmVWxRRlNXbVFDOFhpVmV0TWEvaWJJUzhMcHhDbTV4V0o0anVmYWc3?=
 =?utf-8?B?U0UxU0JBUmowRk5MSXhrY2NQMlVCblpseFljRVQrVWdyVW9qV014RnJLaDZP?=
 =?utf-8?B?V1FSWWRCV3B2KzhsVGUxcTh5STJGWlBsbG5nQWw4UjkzRmNOcHVtSlJCNW01?=
 =?utf-8?B?OElJN3V2UFo1SHhQOEtXcU1oQ0M2T0NDMXBxR0dncDFvYzhzSEdCNUVnc0NR?=
 =?utf-8?B?bXNFQ20vYmM3RTlXTnFHKzlZUHkxOUgwcXVUZHBmWVhWVlpQa3Bta3dCdWZj?=
 =?utf-8?B?T0hCajBiaXhvQjFtd0NUSWRubHp4ZFpicTBQbjJJdWJtQTNXK21OVHNETEJk?=
 =?utf-8?B?Q1hRL3ZlKzB5cWVpMVlJSlc3MHhseW1keGh5RllhTU9VRjhpTDBwSURmL3Rz?=
 =?utf-8?B?OVlacWp0MVViUFBQdG80VXJJSTZYcGlrUW5LRTBjNVlOUWN6RG9TdkVucUE3?=
 =?utf-8?B?VUQ2M0tiVEdZbUp0S2hBYWRHcTlnZVRza3lvaytqTWwzK1ArMjExbXlHd2M5?=
 =?utf-8?B?Yy9wMkJKMnlqcllBNTQ0Q2UrTGNtNUxOYWtTVUlBalFvYVBGTHg5aENhenlz?=
 =?utf-8?B?QXZhYUkzbDFNRFNzOTlCSFpvRFI4d2tNcUVSMTFvckJEc213c2hzbWZjWlBV?=
 =?utf-8?B?L1RIZmhCTThSU1RRbnNwWmR3TEVhaHFEWkhRcFl1MzVuNDUzWjRVaVpzY25q?=
 =?utf-8?B?aEZvMlA2LzlrRUF1WEVTQlFoQUxHS0ZUeWtmYUVSKzZTNjlpNEk4RUdYbkZh?=
 =?utf-8?B?R1h3K0tKUXRCNFJGVyt0RjlXTkpjaGVsWDhCZ0E5a0hucnVuYWxMdHdkdXIz?=
 =?utf-8?B?YTI2Y1F6WXF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdlRlA5NDI4VUpTU2RGOHZnZlpUL1ozOCsxK01oTkkyRFJ3YU9VZDkzZG4r?=
 =?utf-8?B?MEF1ZUpuMVpsTVNDN0h2UFBmV1BSdjBnQzNRbnpHaHg0QlZIU0s0TkdMcENO?=
 =?utf-8?B?M0FWNURzMm9jMGRjWis3ZUtIcGZZRHdXZHY5VkY5UjJrNGJZdk5hejA0SXNp?=
 =?utf-8?B?VnBnNmYzTUVRTWRSTmhJRDBaWUx0S0NyOXZ1RkFBcllwc0hubDRXL3RlRjBn?=
 =?utf-8?B?VlhDTHBpcEtpQmZJcjhmOG04MkJwOXVXSDkva1JBWVNqUnJBaVhoeWc2S3FU?=
 =?utf-8?B?UG85R1V5SXphWGJjV2RuNGRQaGw1N1VhNmd2M2FHRjJIdEoydFpYc3N0VXUx?=
 =?utf-8?B?TGhPa3lXbGw5cEFPTGNjYzN2ejc3WUMvS0pwYXFKcDJsdGp4OXJZeU9yQ25H?=
 =?utf-8?B?MTJTWjN5M1pMbFR6S0VFbXFtWkJKMVo0TGdkS0ZJc096THhQWVVQV2llalQ0?=
 =?utf-8?B?MytLNjJtUDBvYVl1U0JQWnIzcDUyNllpdk1JRGJGTk5DUzh2eC9xY25KNXpU?=
 =?utf-8?B?Y0xjWHVhWEZKbGRBb2pHc0cwYjRsODB1blRESjdKV2RxN3ZjVDJrMWJ0dVNC?=
 =?utf-8?B?UGtDa203TEx5VkpBcTN6ZUgyTWZRTVhFRTlUdTJmcGRUajJkRFAxM21pZmsr?=
 =?utf-8?B?ai9sZ1ZsTWd3YUJnZEhZd0NMSDcraStibFlwMEdacFJzVHVnTWt3Y2RxQ3lj?=
 =?utf-8?B?TktEb1UyWXg2U3h2NEE1UWZocnkwNndSQWNJV05yM1A1c1I3YlE5VmxsRUlG?=
 =?utf-8?B?dHJibzVpWnc5WUtGdDdYdlFhZ243Y1Y3clI0eWNrL2Z5S3p2Slp4b2lZZjFD?=
 =?utf-8?B?NmVaZ25IUWtEaVFTb3lHZkQzdnQwSWpPMHhDbzZmWGoySTlFakpqRjE2bTJk?=
 =?utf-8?B?VVkvNzN4d01lbnpzWW9Nby81WjZzcllFRzBQQ1B1SHhSdVdpWDBLRDJOVFVk?=
 =?utf-8?B?VDhqWmkwUGVrVnhkVjFPZjM1WWxaMVEyV0NZYnVtdmhheVdmeFc1c2x3QVU1?=
 =?utf-8?B?V0ROMXRnMWZhcXpzODN6Y0ZQV2U4dDJkWGxxaDdLSTFmZE9CTUdUdHQxMGxk?=
 =?utf-8?B?bnUwVFFCME9nYnhuY092UzJtWFZWVTZ6L0hadVBPT2JlVjkxcXd0S2tneUF0?=
 =?utf-8?B?blZScmxVZ2RRTU5EaU5udWJsQzhyUjB6aGs4cUVPWmI5V2UrNThRRENIQmVx?=
 =?utf-8?B?YlloMytJdzh2RXdoRkc4WWJGUXByOUJuS0tqRGNWNGRUalpVMkJCUTIzV1ds?=
 =?utf-8?B?djhUbFFYc0drV1k0L0hzcFZMS0xoNjJhbTZoWjh4QzRRUnhzU1poY3pKWGlP?=
 =?utf-8?B?STdnS3g3Y1dpU0wyQ2J6V3ZZM3lqVEFYUzhLSmhhRDZiY3o0U0VScHlhc0ti?=
 =?utf-8?B?SVZ2a1BDbHBDK1RPZWVIZzBWYUI3ei9MMm5ZbDNNUlVmWmlrSFprQW1yVUdY?=
 =?utf-8?B?Sytxc0l5bjVpdk5ic0VUcldtVlN6WDZVOWtaLzlYVHVvRnJwL284TjY1VmFz?=
 =?utf-8?B?RzYrM0w3SENXVHcwN0NsMVZWTE16RjVCYVNUdUF0ZDJQUGx1U1NQeVV3L3BE?=
 =?utf-8?B?Z1RnRnh1UEYweGdFUXVYWXJtZHZwZ0VlelVkU1IyaDhvVlNGaHZCbzh5ZVpP?=
 =?utf-8?B?cG1zaXZ4SFJnM0lENG55OWVCMGhGdm9tL0thZUpkRjdsdnZIYkdmZW13c0N0?=
 =?utf-8?B?bGdsTE9OQklFcUw2YjlYT0FRV2pBZjBTdmY0ZjE4c1o3bVhZSmd1eURqNEQ3?=
 =?utf-8?B?cXNGWlh4YjdYYmdhb1lUV1EvMlVoWEgxWHRZTjBudFliY2J0ZGxwQUJWOUZ2?=
 =?utf-8?B?T0YwVmIyRG8yNG9xYmxmR1BBZTJ2c1dEMkhSY2RZRWhib3RIOWUvMnBySjFH?=
 =?utf-8?B?MThCdENsZmZFRDZlYkMvV2d5VmpIZEdOWkx3T0JMRUNQVUlJQWlRUTgxcFc3?=
 =?utf-8?B?ajIrS3RZMFd2VlRyekZ3ZnNmc21OYU9DMGwwL1BjNnFmVlNzSmVCdGQzSzBk?=
 =?utf-8?B?VDk0NE9GRExwMTFnOXRYNzlqZEYvQVVCQWdUMlE4ZHo1Y1FjbTVqVm5CNWQy?=
 =?utf-8?B?dG56U2NRcER2SldJbUhiS1dtMmJzc3plTVdkMm4xamxVbE1DbDF0MDZyd2dp?=
 =?utf-8?Q?Yd+M=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96641ce8-35ce-4294-3f61-08ddfad12c27
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 18:44:05.5466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sa2s60U2WSTb5S6cpIYNRO9TTuk/ukVBGY9QqQ4itbJOeCkEoviEGa+J2xmamqNNgFX06Ct8XpdNgHc7LCZUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_114417_139721_B960AE95 
X-CRM114-Status: GOOD (  20.58  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMDk6MTU6NDlQTSArMDUzMCwgTWFuaWthbnRhIEd1bnR1
cGFsbGkgd3JvdGU6Cj4gQWRkIE1NSU8gYWNjZXNzb3JzIHRvIHN1cHBvcnQgYmlnLWVuZGlhbiBt
ZW1vcnkgb3BlcmF0aW9ucy4gVGhlc2UgaGVscGVycwo+IGluY2x1ZGUge3JlYWQsIHdyaXRlfXt3
LCBsLCBxfV9iZSgpIGFuZCB7cmVhZCwgd3JpdGV9c3t3LCBsLCBxfV9iZSgpLAo+IHdoaWNoIGFs
bG93cyB0byBhY2Nlc3MgYmlnLWVuZGlhbiBtZW1vcnkgcmVnaW9ucyB3aGlsZSByZXR1cm5pbmcK
PiB0aGUgcmVzdWx0cyBpbiB0aGUgQ1BV4oCZcyBuYXRpdmUgZW5kaWFubmVzcy4KPgo+IFRoaXMg
cHJvdmlkZXMgYSBjb25zaXN0ZW50IGludGVyZmFjZSB0byBpbnRlcmFjdCB3aXRoIGhhcmR3YXJl
IHVzaW5nCj4gYmlnLWVuZGlhbiByZWdpc3RlciBsYXlvdXRzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TWFuaWthbnRhIEd1bnR1cGFsbGkgPG1hbmlrYW50YS5ndW50dXBhbGxpQGFtZC5jb20+Cj4gLS0t
CgpSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cgo+IENoYW5nZXMgc2lu
Y2UgVjc6Cj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VkIGluIFY3Lgo+IC0tLQo+ICBpbmNsdWRlL2Fz
bS1nZW5lcmljL2lvLmggfCAyMDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaAo+IGlu
ZGV4IDExYWJhZDZjODdlMS4uZDE4YThjYTZjMDZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvYXNt
LWdlbmVyaWMvaW8uaAo+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaAo+IEBAIC0yOTUs
NiArMjk1LDk2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZXEodTY0IHZhbHVlLCB2b2xhdGls
ZSB2b2lkIF9faW9tZW0gKmFkZHIpCj4gICNlbmRpZgo+ICAjZW5kaWYgLyogQ09ORklHXzY0QklU
ICovCj4KPiArLyoKPiArICoge3JlYWQsd3JpdGV9e3csbCxxfV9iZSgpIGFjY2VzcyBiaWcgZW5k
aWFuIG1lbW9yeSBhbmQgcmV0dXJuIHJlc3VsdAo+ICsgKiBpbiBuYXRpdmUgZW5kaWFubmVzcy4K
PiArICovCj4gKwo+ICsjaWZuZGVmIHJlYWR3X2JlCj4gKyNkZWZpbmUgcmVhZHdfYmUgcmVhZHdf
YmUKPiArc3RhdGljIGlubGluZSB1MTYgcmVhZHdfYmUoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lv
bWVtICphZGRyKQo+ICt7Cj4gKwl1MTYgdmFsOwo+ICsKPiArCWxvZ19yZWFkX21taW8oMTYsIGFk
ZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOwo+ICsJX19pb19icigpOwo+ICsJdmFsID0gX19iZTE2
X3RvX2NwdSgoX19iZTE2IF9fZm9yY2UpX19yYXdfcmVhZHcoYWRkcikpOwo+ICsJX19pb19hcih2
YWwpOwo+ICsJbG9nX3Bvc3RfcmVhZF9tbWlvKHZhbCwgMTYsIGFkZHIsIF9USElTX0lQXywgX1JF
VF9JUF8pOwo+ICsJcmV0dXJuIHZhbDsKPiArfQo+ICsjZW5kaWYKPiArCj4gKyNpZm5kZWYgcmVh
ZGxfYmUKPiArI2RlZmluZSByZWFkbF9iZSByZWFkbF9iZQo+ICtzdGF0aWMgaW5saW5lIHUzMiBy
ZWFkbF9iZShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCj4gK3sKPiArCXUzMiB2
YWw7Cj4gKwo+ICsJbG9nX3JlYWRfbW1pbygzMiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7
Cj4gKwlfX2lvX2JyKCk7Cj4gKwl2YWwgPSBfX2JlMzJfdG9fY3B1KChfX2JlMzIgX19mb3JjZSlf
X3Jhd19yZWFkbChhZGRyKSk7Cj4gKwlfX2lvX2FyKHZhbCk7Cj4gKwlsb2dfcG9zdF9yZWFkX21t
aW8odmFsLCAzMiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7Cj4gKwlyZXR1cm4gdmFsOwo+
ICt9Cj4gKyNlbmRpZgo+ICsKPiArI2lmZGVmIENPTkZJR182NEJJVAo+ICsjaWZuZGVmIHJlYWRx
X2JlCj4gKyNkZWZpbmUgcmVhZHFfYmUgcmVhZHFfYmUKPiArc3RhdGljIGlubGluZSB1NjQgcmVh
ZHFfYmUoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQo+ICt7Cj4gKwl1NjQgdmFs
Owo+ICsKPiArCWxvZ19yZWFkX21taW8oNjQsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOwo+
ICsJX19pb19icigpOwo+ICsJdmFsID0gX19iZTY0X3RvX2NwdSgoX19iZTY0IF9fZm9yY2UpX19y
YXdfcmVhZHEoYWRkcikpOwo+ICsJX19pb19hcih2YWwpOwo+ICsJbG9nX3Bvc3RfcmVhZF9tbWlv
KHZhbCwgNjQsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOwo+ICsJcmV0dXJuIHZhbDsKPiAr
fQo+ICsjZW5kaWYKPiArI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+ICsKPiArI2lmbmRlZiB3
cml0ZXdfYmUKPiArI2RlZmluZSB3cml0ZXdfYmUgd3JpdGV3X2JlCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCB3cml0ZXdfYmUodTE2IHZhbHVlLCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCj4g
K3sKPiArCWxvZ193cml0ZV9tbWlvKHZhbHVlLCAxNiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQ
Xyk7Cj4gKwlfX2lvX2J3KCk7Cj4gKwlfX3Jhd193cml0ZXcoKHUxNiBfX2ZvcmNlKV9fY3B1X3Rv
X2JlMTYodmFsdWUpLCBhZGRyKTsKPiArCV9faW9fYXcoKTsKPiArCWxvZ19wb3N0X3dyaXRlX21t
aW8odmFsdWUsIDE2LCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKPiArfQo+ICsjZW5kaWYK
PiArCj4gKyNpZm5kZWYgd3JpdGVsX2JlCj4gKyNkZWZpbmUgd3JpdGVsX2JlIHdyaXRlbF9iZQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVsX2JlKHUzMiB2YWx1ZSwgdm9sYXRpbGUgdm9pZCBf
X2lvbWVtICphZGRyKQo+ICt7Cj4gKwlsb2dfd3JpdGVfbW1pbyh2YWx1ZSwgMzIsIGFkZHIsIF9U
SElTX0lQXywgX1JFVF9JUF8pOwo+ICsJX19pb19idygpOwo+ICsJX19yYXdfd3JpdGVsKCh1MzIg
X19mb3JjZSlfX2NwdV90b19iZTMyKHZhbHVlKSwgYWRkcik7Cj4gKwlfX2lvX2F3KCk7Cj4gKwls
b2dfcG9zdF93cml0ZV9tbWlvKHZhbHVlLCAzMiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7
Cj4gK30KPiArI2VuZGlmCj4gKwo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gKyNpZm5kZWYgd3Jp
dGVxX2JlCj4gKyNkZWZpbmUgd3JpdGVxX2JlIHdyaXRlcV9iZQo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgd3JpdGVxX2JlKHU2NCB2YWx1ZSwgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQo+ICt7
Cj4gKwlsb2dfd3JpdGVfbW1pbyh2YWx1ZSwgNjQsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8p
Owo+ICsJX19pb19idygpOwo+ICsJX19yYXdfd3JpdGVxKCh1NjQgX19mb3JjZSlfX2NwdV90b19i
ZTY0KHZhbHVlKSwgYWRkcik7Cj4gKwlfX2lvX2F3KCk7Cj4gKwlsb2dfcG9zdF93cml0ZV9tbWlv
KHZhbHVlLCA2NCwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7Cj4gK30KPiArI2VuZGlmCj4g
KyNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPiArCj4gIC8qCj4gICAqIHtyZWFkLHdyaXRlfXti
LHcsbCxxfV9yZWxheGVkKCkgYXJlIGxpa2UgdGhlIHJlZ3VsYXIgdmVyc2lvbiwgYnV0Cj4gICAq
IGFyZSBub3QgZ3VhcmFudGVlZCB0byBwcm92aWRlIG9yZGVyaW5nIGFnYWluc3Qgc3BpbmxvY2tz
IG9yIG1lbW9yeQo+IEBAIC01MjQsNiArNjE0LDExOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3Jp
dGVzcSh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsIGNvbnN0IHZvaWQgKmJ1ZmZlciwKPiAg
I2VuZGlmCj4gICNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPgo+ICsvKgo+ICsgKiB7cmVhZCx3
cml0ZX1ze3csbCxxfV9iZSgpIHJlcGVhdGVkbHkgYWNjZXNzIHRoZSBzYW1lIG1lbW9yeSBhZGRy
ZXNzCj4gKyAqIGluIGJpZyBlbmRpYW5uZXNzIGluIDE2LSwgMzItIG9yIDY0LWJpdCBjaHVua3Mg
KEBjb3VudCB0aW1lcykgYW5kCj4gKyAqIHJldHVybiByZXN1bHQgaW4gbmF0aXZlIGVuZGlhbm5l
c3MuCj4gKyAqLwo+ICsKPiArI2lmbmRlZiByZWFkc3dfYmUKPiArI2RlZmluZSByZWFkc3dfYmUg
cmVhZHN3X2JlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCByZWFkc3dfYmUoY29uc3Qgdm9sYXRpbGUg
dm9pZCBfX2lvbWVtICphZGRyLAo+ICsJCQkgICAgIHZvaWQgKmJ1ZmZlciwKPiArCQkJICAgICB1
bnNpZ25lZCBpbnQgY291bnQpCj4gK3sKPiArCWlmIChjb3VudCkgewo+ICsJCXUxNiAqYnVmID0g
YnVmZmVyOwo+ICsKPiArCQlkbyB7Cj4gKwkJCXUxNiB4ID0gX19iZTE2X3RvX2NwdSgoX19iZTE2
IF9fZm9yY2UpX19yYXdfcmVhZHcoYWRkcikpOwo+ICsJCQkqYnVmKysgPSB4Owo+ICsJCX0gd2hp
bGUgKC0tY291bnQpOwo+ICsJfQo+ICt9Cj4gKyNlbmRpZgo+ICsKPiArI2lmbmRlZiByZWFkc2xf
YmUKPiArI2RlZmluZSByZWFkc2xfYmUgcmVhZHNsX2JlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBy
ZWFkc2xfYmUoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyLAo+ICsJCQkgICAgIHZv
aWQgKmJ1ZmZlciwKPiArCQkJICAgICB1bnNpZ25lZCBpbnQgY291bnQpCj4gK3sKPiArCWlmIChj
b3VudCkgewo+ICsJCXUzMiAqYnVmID0gYnVmZmVyOwo+ICsKPiArCQlkbyB7Cj4gKwkJCXUzMiB4
ID0gX19iZTMyX3RvX2NwdSgoX19iZTMyIF9fZm9yY2UpX19yYXdfcmVhZGwoYWRkcikpOwo+ICsJ
CQkqYnVmKysgPSB4Owo+ICsJCX0gd2hpbGUgKC0tY291bnQpOwo+ICsJfQo+ICt9Cj4gKyNlbmRp
Zgo+ICsKPiArI2lmZGVmIENPTkZJR182NEJJVAo+ICsjaWZuZGVmIHJlYWRzcV9iZQo+ICsjZGVm
aW5lIHJlYWRzcV9iZSByZWFkc3FfYmUKPiArc3RhdGljIGlubGluZSB2b2lkIHJlYWRzcV9iZShj
b25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsCj4gKwkJCSAgICAgdm9pZCAqYnVmZmVy
LAo+ICsJCQkgICAgIHVuc2lnbmVkIGludCBjb3VudCkKPiArewo+ICsJaWYgKGNvdW50KSB7Cj4g
KwkJdTY0ICpidWYgPSBidWZmZXI7Cj4gKwo+ICsJCWRvIHsKPiArCQkJdTY0IHggPSBfX2JlNjRf
dG9fY3B1KChfX2JlNjQgX19mb3JjZSlfX3Jhd19yZWFkcShhZGRyKSk7Cj4gKwkJCSpidWYrKyA9
IHg7Cj4gKwkJfSB3aGlsZSAoLS1jb3VudCk7Cj4gKwl9Cj4gK30KPiArI2VuZGlmCj4gKyNlbmRp
ZiAvKiBDT05GSUdfNjRCSVQgKi8KPiArCj4gKyNpZm5kZWYgd3JpdGVzd19iZQo+ICsjZGVmaW5l
IHdyaXRlc3dfYmUgd3JpdGVzd19iZQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVzd19iZSh2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsCj4gKwkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZmZl
ciwKPiArCQkJICAgICAgdW5zaWduZWQgaW50IGNvdW50KQo+ICt7Cj4gKwlpZiAoY291bnQpIHsK
PiArCQljb25zdCB1MTYgKmJ1ZiA9IGJ1ZmZlcjsKPiArCj4gKwkJZG8gewo+ICsJCQlfX3Jhd193
cml0ZXcoKHUxNiBfX2ZvcmNlKV9fY3B1X3RvX2JlMTYoKmJ1ZiksIGFkZHIpOwo+ICsJCQlidWYr
KzsKPiArCQl9IHdoaWxlICgtLWNvdW50KTsKPiArCX0KPiArfQo+ICsjZW5kaWYKPiArCj4gKyNp
Zm5kZWYgd3JpdGVzbF9iZQo+ICsjZGVmaW5lIHdyaXRlc2xfYmUgd3JpdGVzbF9iZQo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgd3JpdGVzbF9iZSh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsCj4g
KwkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZmZlciwKPiArCQkJICAgICAgdW5zaWduZWQgaW50IGNv
dW50KQo+ICt7Cj4gKwlpZiAoY291bnQpIHsKPiArCQljb25zdCB1MzIgKmJ1ZiA9IGJ1ZmZlcjsK
PiArCj4gKwkJZG8gewo+ICsJCQlfX3Jhd193cml0ZWwoKHUzMiBfX2ZvcmNlKV9fY3B1X3RvX2Jl
MzIoKmJ1ZiksIGFkZHIpOwo+ICsJCQlidWYrKzsKPiArCQl9IHdoaWxlICgtLWNvdW50KTsKPiAr
CX0KPiArfQo+ICsjZW5kaWYKPiArCj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiArI2lmbmRlZiB3
cml0ZXNxX2JlCj4gKyNkZWZpbmUgd3JpdGVzcV9iZSB3cml0ZXNxX2JlCj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCB3cml0ZXNxX2JlKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkciwKPiArCQkJICAg
ICAgY29uc3Qgdm9pZCAqYnVmZmVyLAo+ICsJCQkgICAgICB1bnNpZ25lZCBpbnQgY291bnQpCj4g
K3sKPiArCWlmIChjb3VudCkgewo+ICsJCWNvbnN0IHU2NCAqYnVmID0gYnVmZmVyOwo+ICsKPiAr
CQlkbyB7Cj4gKwkJCV9fcmF3X3dyaXRlcSgodTY0IF9fZm9yY2UpX19jcHVfdG9fYmU2NCgqYnVm
KSwgYWRkcik7Cj4gKwkJCWJ1ZisrOwo+ICsJCX0gd2hpbGUgKC0tY291bnQpOwo+ICsJfQo+ICt9
Cj4gKyNlbmRpZgo+ICsjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4gKwo+ICAjaWZuZGVmIFBD
SV9JT0JBU0UKPiAgI2RlZmluZSBQQ0lfSU9CQVNFICgodm9pZCBfX2lvbWVtICopMCkKPiAgI2Vu
ZGlmCj4gLS0KPiAyLjM0LjEKPgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
