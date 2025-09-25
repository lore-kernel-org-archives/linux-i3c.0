Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70799CAC5B1
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSoRBCMhlXrTwq14npRJn+3LrJX/mteM2vqlAdwQJiU=; b=w0ry6adc7ORt/A
	vXttCV6fimzbmZ9jHRJ3G3blIN+eYCxAufRRVcS8vRfoQoFCFAYmqnlJBOdG3trkVNnmIRVUDYfI8
	NDCf9coziq0mNl2gwAeIfBE3sXoAYA7Y4QAN2bikg3rrbWt23+fzfWkvaEoyEmOy6OIaO7TBcZNz/
	fR0IrCpQeZ9mMT0K3jQnYtRuwhhGhdOfu83LwfN0JuaZFJ7rv+qwDePql3oW0zS6TimF6GTVV/gQU
	5YPgvpuSf5CE/ej9kltdUDKHYAWfgPGmI0QHxP+3bW+fSdEuI2ELaX4jcOPVgYRUq9gYf7PcPSR6n
	Sg1s3wU5/VucrZjoGTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pBJ-0000000BHMd-0vZp;
	Thu, 25 Sep 2025 16:50:57 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pBG-0000000BHK6-13aW
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 16:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnr0LRfeWm3pgUuxCFqbRIoXcd2dvWvtwhaf5ZeC2xjP+XeKs6Nvx3QuK7n3tp2CE0kKcHWrzrXqARVkY+bnqR+J4Q+sI6dWVRRbSOP3FpWfcO5cvnl7PdxmJQKv5SV3K35R0WO6FJeOax5M16ke2If3ir0wKy31ZZk1MLDO7yDWBCvxl0WDxF/I88Ajp7BJJAchhAytpQLif0qRNDmsEQf1TE/LKduH1uFtPIWq33lWqfl3vTVYe45h2cwvTCYFyKtjm/c2qLu7YcQnQ+5gf/MQX7/P+EFJtRsGeijmAjeJ4mlKNNaOY/zNdB1GuHDMGIuW/Fvx0DdmPNVwYvu7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2IR9h+SkvS8TFYiCxCdIObSFXD7fvR9YDYLiiw+430=;
 b=S11j6vGtDKoZNAG3fCVJgLt81CpVQFYB/KZxdpjGpVtEgy4ZQPY2NijB1neC6N2BM0TgnfPH8PrcvwLllj79W9/InMf02/eA7cqaj1Z6H1xJ4vRDVyWt1L9YRjKVav+J+nYQEDPd2UwgPGYdFtCBVqAjFnPwmvUdBrn+PJ+Gd5oDG4a1QlkTzhalg2pn0biWj2amaFgJjoOg58KC9l88LPKdUAJaE6lLJ53zGxblOxzsz5dFBew4GZV0f2baF4Cb5UFcQw4u3SI+++aQu2TvXJXHJlihadRyxfaqOwiBZumY/DvjiPm4aWl7BVgpT3bcM10AG0WKdyKHGF6854uMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2IR9h+SkvS8TFYiCxCdIObSFXD7fvR9YDYLiiw+430=;
 b=iI6r3MiNIlkE+rJZ9cBfjFzZtXx+820pzQELbnWyiGbnAIkZuB6LcxaeMXeYa2G1R2FjhchCN4ehIZyq8LQEBL5LQwpg3bDKrqH6A4oOTNi0S6WIuJytbGBWLEmX22bVDrqDFSnvEZFa9LcgEA+swNHEfocoT6m0l0S6BZHV2RWvajsaHO0jpqwj/gluejUWZcZf+UG+Zf92Zy/dY1B4gH9kB64cD/7Q1q58VckljZ1GJQ6vGvy8AeYxOlUKQR03rIYBu1OUNwwn2TJ2+B/PWlc9VLZ1onIG447IKY0IiikBGL9piQhA2qJ7Ym6d8Awf0Kv/4jqf1uZDve48ayRlsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB10364.eurprd04.prod.outlook.com (2603:10a6:10:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 16:50:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 16:50:46 +0000
Date: Thu, 25 Sep 2025 12:50:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "git (AMD-Xilinx)" <git@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"tommaso.merciai.xr@bp.renesas.com" <tommaso.merciai.xr@bp.renesas.com>,
	"quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>,
	"S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jorge Marques <jorge.marques@analog.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"Goud, Srinivas" <srinivas.goud@amd.com>,
	"Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for
 i3c_readl_fifo() and i3c_writel_fifo()
Message-ID: <aNVy22ayfAsw+Zgj@lizhi-Precision-Tower-5810>
References: <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
 <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4199b1ca-c1c7-41ef-b053-415f0cd80468@app.fastmail.com>
 <DM4PR12MB6109E009DAC953525093FE808C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <134c3a96-4023-47ab-8aa9-fd6ab75e5654@app.fastmail.com>
 <DM4PR12MB610989A03A7560F2A03792838C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <295ee05e-3366-4846-9c8b-85ac09d79d48@app.fastmail.com>
 <DM4PR12MB61090F307DBA2B99AFC93B168C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <b2ce3e0b-a639-4e70-a5e7-ffbdc855153e@app.fastmail.com>
 <DM4PR12MB610946C438F742BA743A0BDA8C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <DM4PR12MB610946C438F742BA743A0BDA8C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 078a664c-3faf-4a93-7236-08ddfc53ac2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1d4dFdiYWt6M3Y3Uk5lNy9kenNLV0lEQ2h5WXBXVkdNYVdaVXFpRi9xd2Fr?=
 =?utf-8?B?VXFZNmVqL1pmRWhtMzFnc0RSVnVpSkpOSGtWdXlxZzdiV1gxVmVZMUpHQUpj?=
 =?utf-8?B?blJlbGF0RVBJdDNiNlpzVEYyWWMvTlpxNUNhN1FEZENJdUsvV1AyUFI1bmlO?=
 =?utf-8?B?NVZXd1JKUnRwY3pGbDhxVHBPSFhJTWJYUDZkZVAxeFdFVFFQWktKN0dIWW8z?=
 =?utf-8?B?dVFMUGJ4T2Rjei9xaytaSWJSZDJYa0Q4clcrSlM1dlFhVFhybWZQaDZ3V20v?=
 =?utf-8?B?M3N1bHl1NVU1OFlOSlRsZWpNUStYeVhaaUdxT3lDM2I2K213azlya2Z6dE5V?=
 =?utf-8?B?N013TFh3enNmWHZXY3dRNUZlNlovdWRQdkxxTDI0cjJoZWFaTGdxTngxRnVI?=
 =?utf-8?B?SmFiUnZtVXY4WGtSd0JXOU11UEFaWW42NVlSOHJRVVE3TTQreUFqUHR1TmNR?=
 =?utf-8?B?WHQ3TXRHZ3pGWVdZNkpVKzVUc0FqSWF3WVpZdTVDUGJ2dzBJUFRvbE5DbGVL?=
 =?utf-8?B?cUU5TEg2SFBJYUN0WHdkUHgxTHBKS0xvUG5xeXRBVFV6MVNBMmFob0Z3QlhJ?=
 =?utf-8?B?NVlSamRxcUE1WVI3Nm5xUnVwQXhUV1o1RE8rNXZudldZMlAyKzFFYkZuOGZW?=
 =?utf-8?B?L2FicE03Y1MrOXJ5YWswRWVBNjV6d3M4NkJRbmh2eFZJYk9MV2JEVzlyZzA4?=
 =?utf-8?B?M2phMlRmRzIzMFVaZ3ViOGw5SStvUEFnK2l2T3krQWNpQTd0OVBrMm9Xaktm?=
 =?utf-8?B?YVN5RjFhZEZ2OW5BY3hUdzRvQzhGT0FYTktxL1BlMXd5Qmhwekw3bVg0M0FZ?=
 =?utf-8?B?eDl6SENIVUVEamxQVTdmSmlGTXBUOUdhNnR2Szk3RWNEcjFpcStVenVYZ1pr?=
 =?utf-8?B?dE1hSEFNM1YxSFUvQkd6dkM1TnhPT0hWaHJsek5IekVNcldnY0J4Z2E2UEtJ?=
 =?utf-8?B?bWhoYTFsNGw2NXZodzVHQlhXdkNXT2hWNmlWdHBHNURaWnV5YldtcFZhbE05?=
 =?utf-8?B?RWhOS3RScFk3NjdqMTRXRmlmcXFXNkxNSFF4QU53NWtVMS9HVlo2b2NUQzFy?=
 =?utf-8?B?M1pwVkZBNlk5ajI1K3psWHFoakhDSllxc3lFQ3ZTaXZXMmRVY21mdzFxRWZC?=
 =?utf-8?B?UVZrSjZYZUJYMzFSSWxBTXY2R0d4MHBsS1hUWnh6QWwyR1pEeXpic3RvZVV0?=
 =?utf-8?B?UlBsZEdQYlVWQ2Q4MFRmNXFpZHE5czVCRFNVUXVTNkppamJYWlhMcVViUHp4?=
 =?utf-8?B?eXJSeDNpMzJ3QkpMV0t5eitjZTdKYk1KMy92ZDIvR1FJd2ZVdVJsbVhyZDFy?=
 =?utf-8?B?ZHZCT1JYMGxxc2NiR2g2aEllZ3dud1ByWWJxSEh6ZUk3M2xOVlZFQlhQM0NP?=
 =?utf-8?B?UFZabXA1Zm5XWS9ocjdRZ0xlVW54Tm5XalA3bjRoL0poTWZoSitOU3NDaXN6?=
 =?utf-8?B?bDVqS0tmcWZWRUpYcVNFcDI2bTVpV0xUMVJnSC9ERHpVU3NIY0pWeC93RHhP?=
 =?utf-8?B?dmFCSEVUcUVBM1FvVUthNm16TloxNjRxQXBCdUpSd2JDQnFxRWpOYnhTRUdX?=
 =?utf-8?B?ckNhVjhuVHFVQUtZVEJnUXpoOGVDang2QUhJQitIRWcrSEU3RFY2SmovdWlm?=
 =?utf-8?B?enZqRlUyS2dqWkcxQkFET1YwcjhvTmhuVUNaM0c4cU1FTlNUaTFQU1BHbE5C?=
 =?utf-8?B?TnoxZFhwZk5WWEQvQmp0NzZQT1FpNGlCZi9IZkpKV0s4a2lWTFRFWG03ZVdU?=
 =?utf-8?B?dVNDeWZ1cVRZdGFHWGxLbVNjM0M1cEg1dWc1K2VPYVVsYTVFYU1NNUY2cTdr?=
 =?utf-8?B?M1NINzVqMUJkY3E0V2RMWFdlcXBrb0o3TVR6ZDhUUlAxNVNSWndBZWEzQktn?=
 =?utf-8?B?NFVGU2xsY0Q5ZTFkUnJ5ZmZrT09TT0l1U1VlWDVSWDVpNzhML1lTZ2ZNeEtx?=
 =?utf-8?B?U2xjUlpQM1ZYaG5oVnJidlFTVTdvSjQ2NWhKbTVuTkVTaVFtN215Nk53TFBZ?=
 =?utf-8?B?bHpJeG93UlZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXdzUnFVdy9XZlBMN201ZzFyQ2s4Y3FhV2Fxc2hvd1hLWDBXSWVWSDFNUjEx?=
 =?utf-8?B?cHJGa3g0M25QTE11dmFBWkJxY05oVzVLcHlhL1JqVUVRUzhRMWowRGJqbnFy?=
 =?utf-8?B?WCs5ZE54b2JYWGYvRjE4bHIwb0t5TFQwL2NzUGt0cFJTT0MvejZ3WU8vbjNV?=
 =?utf-8?B?Z2tqNG5LWGZ4cEk1d1JIY3VtZTczVjdYRi9SRXk2czhkUGxtQ1Vkd1RBMVpx?=
 =?utf-8?B?a1l3NGVKR1NmTmhNTWtpU1g0cC8rbVhOTDQ1Z05PZW9KS01qWGhxUDlOY1Zq?=
 =?utf-8?B?aTdjOHh4R3JDNWd0SElEUG9heStkZ01Fald2R1FjQm9zTjRGallCTUMzOGh0?=
 =?utf-8?B?S3AwdWdmUTBUdGtqaU1BZUovOFhiRDlpRUxGNlJ4WDcwSzFSMUk5TGs2ckZy?=
 =?utf-8?B?ZHpaQzhGQnJkTG9hUTZQTndaTFlmQW8yeXVWVndMcWVVc2dBMnhOVFJMZG9M?=
 =?utf-8?B?WU92am5UUVQwM1JJR2pVT1IwM05WRWFYZ0JuRjFtaGRjSGUxTmw2a25yN1du?=
 =?utf-8?B?OXV4Y3BVRTJQRXZRVkU0M0VFUldSN05sbGdPeXNQVFNzbktXVDBzNHRXWTFW?=
 =?utf-8?B?a0MwN0lEd0cxZlR1RHR3eUx6d0VJdHhkdUNjMnY0WGRPTG5LTm85YzRwc3Ba?=
 =?utf-8?B?ci9OZVNWanNQZkJ4MlVaSGJzdmhnZTZ0a0NPM3hsMFIvenZSVnBvOUlkd3N4?=
 =?utf-8?B?RXk3ZmZxMlZDNjVvVHRlblRmUDBQZzgxY0lBemVpT1F4c0dMWGtKQkxnblhs?=
 =?utf-8?B?YVdOYkkrK0Q3aWdZbTlqREhENjRETm9GZkJLeDZIVzJMZUtvZmVjVi9OcEpy?=
 =?utf-8?B?dFVMeFQ3d2hUWUF4d3dyVWpqV3RROWdwY3dBMlJ3MWFQVVBCc2ppWUtEbGV0?=
 =?utf-8?B?OSt1RVRXQlVGQ2RrT0FLVUpLRnBNa2pVWFBqb3pGNmhySjNBc3NqSmF6Q3pJ?=
 =?utf-8?B?c0kwdjNyTTh2N2JZZHh3bTI2ZWd1TTY4T0toYS9FQkg5WWlzWVRrTStwSEMw?=
 =?utf-8?B?em9UQ0pxMW5YVGxtdnN6K3dJRjF5cUxTeWJ5VGlqVXJBUnJGK3JQRUJWd1d5?=
 =?utf-8?B?T3RJeW5GMXcvZDhxWEM1cVc1akxPU21UdUpvWko1cURKMjF0RHExczQ4c2cy?=
 =?utf-8?B?blBNWEozaHFDcm9xL2RFTEdRTExrS01SY2J1SXRpU2I0K21wU3R1YW5xdzdj?=
 =?utf-8?B?b2RjSlJKQVBZNlhtL0NROFN2ZGc2b1RFKzRkQ1NDYVpyN1pWNFZGbEVVbmti?=
 =?utf-8?B?WnJ6ZEFRdlo2c2FkUXlQSzF5aFNpUmlXTWpIUjkzaUk4YzN3dURoWjVUMk9j?=
 =?utf-8?B?T1A1eW9WNmdqZmJhZVJGWTcrWmpaVVJ3S2pEMkJ5R3F1Q0J3cC84Y2tKRGM4?=
 =?utf-8?B?am9LT29LYTA2aW0rN2JpdW4reERJSlNtVFVHamxDaGNVM2tFS2RqSWlrRlRw?=
 =?utf-8?B?YUwrekl4dUJqWU1oc1hWK21uWVhhV0d0MXFMdmRjR3JTTldJeERpSGlUc3Jn?=
 =?utf-8?B?d25rcmNhVHhleWt2RmJ4M0VvNXp4OU5oNVVuUWZKVEQ5ZUd6TmowdnFIazlr?=
 =?utf-8?B?REMreGhoZW9aRDZYdkUva0I1TWJ3Z0NUeHYrQSthRnZIdkJnQ3pPUENJWmI1?=
 =?utf-8?B?Z2wzRWtOQ2dvZ2tHRHFIeFQ2ZE52SS9pcCtjOEFCKzU2ZllNTTdMYmdkR2JO?=
 =?utf-8?B?R2hUKzkwUCtTczBBUEFNSE9MeHlidGRpdUlCMVJ6NDczUVJLR2NxMUN3M2M2?=
 =?utf-8?B?ZG1VRVlHdjNER0NiS1d0aHBSQVc5WTV4TW1BWlNadmxLdEZuY04rS3FWL0I0?=
 =?utf-8?B?eXRaYUVNQkhwdjNhazJSS1BjMzJzdzN3VzlJRGNHQ1VpZCtpR2tWQkNPQnJJ?=
 =?utf-8?B?VE9wazhOK3VJaEppRmFETGtsZDM3aHIzODRpOUhIU2NGL1JJcjRTWWY3N2Na?=
 =?utf-8?B?SEliWDZZc1ZxN21BU3E1bGNobGxNRWZKQUxpdTBZczJCVzBjMWg5UEdTZHhK?=
 =?utf-8?B?VXBxbW1IUUloaG9MYlY3YzVxTVhob2Uxd3VvbTByaUUxUllUaWF3K2pvNURx?=
 =?utf-8?B?cmszWUpoeklYUTQ5TXI5Z1E1SFZ2a3Z3WHluVzhQUU5uMlYvL05QOS90WjBN?=
 =?utf-8?Q?DyboanIHpUT6hDDyLLZTxN9mM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078a664c-3faf-4a93-7236-08ddfc53ac2b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:50:46.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckFCBlAgMyKEVUVMSOh+RCbDMdjYJf9duage5tZyuD0Afy/nS90b+YkI4d3TNwFkKe1qt+0L+LsC0DbqfzwERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_095054_452839_0E4F060C 
X-CRM114-Status: GOOD (  42.05  )
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgMDQ6Mzc6NTRQTSArMDAwMCwgR3VudHVwYWxsaSwgTWFu
aWthbnRhIHdyb3RlOgo+IFtQdWJsaWNdCj4KPiBIaSwKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiBTZW50
OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI1IDU6NDUgUE0KPiA+IFRvOiBHdW50dXBhbGxp
LCBNYW5pa2FudGEgPG1hbmlrYW50YS5ndW50dXBhbGxpQGFtZC5jb20+OyBnaXQgKEFNRC1YaWxp
bngpCj4gPiA8Z2l0QGFtZC5jb20+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNv
bT47IEFsZXhhbmRyZSBCZWxsb25pCj4gPiA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+
OyBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT47IFJvYiBIZXJyaW5nCj4gPiA8cm9iaEBrZXJu
ZWwub3JnPjsga3J6aytkdEBrZXJuZWwub3JnOyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5l
bC5vcmc+Owo+ID4gUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPjsgV29sZnJhbSBT
YW5nIDx3c2ErcmVuZXNhc0BzYW5nLQo+ID4gZW5naW5lZXJpbmcuY29tPjsgdG9tbWFzby5tZXJj
aWFpLnhyQGJwLnJlbmVzYXMuY29tOwo+ID4gcXVpY19tc2F2YWxpeUBxdWljaW5jLmNvbTsgUy1r
LCBTaHlhbS1zdW5kYXIgPFNoeWFtLXN1bmRhci5TLWtAYW1kLmNvbT47Cj4gPiBTYWthcmkgQWls
dXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyAnYmlsbHlfdHNhaUBhc3BlZWR0ZWNo
LmNvbScKPiA+IDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPjsgS2VlcyBDb29rIDxrZWVzQGtl
cm5lbC5vcmc+OyBHdXN0YXZvIEEuIFIuIFNpbHZhCj4gPiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3Jn
PjsgSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBKb3JnZQo+
ID4gTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPjsgbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7Cj4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgTGludXgtQXJjaCA8bGludXgtCj4gPiBhcmNoQHZnZXIua2VybmVs
Lm9yZz47IGxpbnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBQYW5kZXksIFJh
ZGhleSBTaHlhbSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPjsgR291ZCwgU3Jpbml2YXMK
PiA+IDxzcmluaXZhcy5nb3VkQGFtZC5jb20+OyBEYXR0YSwgU2h1YmhyYWp5b3RpIDxzaHViaHJh
anlvdGkuZGF0dGFAYW1kLmNvbT47Cj4gPiBtYW5pb24wNWdrQGdtYWlsLmNvbQo+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCBWNyAzLzRdIGkzYzogbWFzdGVyOiBBZGQgZW5kaWFubmVzcyBzdXBwb3J0
IGZvciBpM2NfcmVhZGxfZmlmbygpCj4gPiBhbmQgaTNjX3dyaXRlbF9maWZvKCkKPiA+Cj4gPiBP
biBUaHUsIFNlcCAyNSwgMjAyNSwgYXQgMTE6MjYsIEd1bnR1cGFsbGksIE1hbmlrYW50YSB3cm90
ZToKPiA+Cj4gPiA+PiBDYW4geW91IGV4cGxhaW4gaG93IHRoYXQgd29ya3M/IFdoYXQgSSBzZWUg
aXMgdGhhdCB5b3VyCj4gPiA+PiByZWFkc2xfYmUoKS93cml0ZXNsX2JlKCkgZnVuY3Rpb25zIGRv
IGEgYnl0ZXN3YXAgb24gZXZlcnkgZm91ciBieXRlcywKPiA+ID4+IHNvIHRoZSBieXRlc3RyZWFt
IHRoYXQgZ2V0cyBjb3BpZWQgdG8vZnJvbSB0aGUgRklGTyBnZXRzIGdhcmJsZWQsIGluCj4gPiA+
PiBwYXJ0aWN1bGFyIHRoZSBmaW5hbAo+ID4gPj4gKHVuYWxpZ25lZCkgYnl0ZXMgb2YgdGhlIGtl
cm5lbCBidWZmZXIgZW5kIHVwIGluIHRoZSBoaWdoZXIgYnl0ZXMgb2YKPiA+ID4+IHRoZSBGSUZP
IHJlZ2lzdGVyIHJhdGhlciB0aGFuIHRoZSBmaXJzdCBieXRlcyBhcyB0aGV5IGRvIG9uIGEgYmln
LWVuZGlhbiBrZXJuZWwuCj4gPiA+Pgo+ID4gPj4gQXJlIGJvdGggdGhlIGJpZy1lbmRpYW4gYW5k
IGxpdHRsZS1lbmRpYW4ga2VybmVscyBpbiB5b3VyIHRlc3RzIG9uCj4gPiA+PiBtaWNyb2JsYXpl
LCB1c2luZyB0aGUgdXBzdHJlYW0gdmVyc2lvbiBvZiBhc20vaW8uaD8gSXMgdGhlcmUgYQo+ID4g
Pj4gaGFyZHdhcmUgYnl0ZXN3YXAgYmV0d2VlbiB0aGUgQ1BVIGxvY2FsIGJ1cyBhbmQgdGhlIGkz
YyBjb250cm9sbGVyPwo+ID4gPj4gSWYgdGhlcmUgaXMgb25lLCBpcyBpdCBzZXQgdGhlIHNhbWUg
d2F5IGZvciBib3RoIGtlcm5lbHM/Cj4gPiA+Pgo+ID4gPiBUbyBjbGFyaWZ5LCBteSB0ZXN0aW5n
IHdhcyBwZXJmb3JtZWQgb24gdGhlIGxhdGVzdCB1cHN0cmVhbSBrZXJuZWwgb24KPiA+ID4gYQo+
ID4gPiBaQ1UxMDIgKFp5bnEgVWx0cmFTY2FsZSsgTVBTb0MsIENvcnRleC1BNTMsIGxpdHRsZS1l
bmRpYW4pIHdpdGgKPiA+ID4gYmlnLWVuZGlhbiBGSUZPcyBhbmQgbm8gYnVzLWxldmVsIGJ5dGVz
d2FwLiBGb3IgbW9yZSBkZXRhaWxzLCBwbGVhc2UKPiA+ID4gcmVmZXIgdG8gbXkgcmVwbHkgaW4g
UmU6IFtQQVRDSF0gW3YyXSBpM2M6IGZpeCBiaWctZW5kaWFuIEZJRk8KPiA+ID4gdHJhbnNmZXJz
Lgo+ID4KPiA+IE9rLCB0aGFua3MgZnJvIHRoZSBjbGFyaWZpY2F0aW9uLiBJIGdvdCBjb25mdXNl
ZCBieSB5b3VyIGRlc2NyaXB0aW9uIG1lbnRpb25pbmcgYmlnLQo+ID4gZW5kaWFuIGluIFtQQVRD
SCBWNyAzLzRdIGFuZCBhc3N1bWVkIHRoaXMgd291bGQgYmUgb24gYSBiaWctZW5kaWFuIG1pY3Jv
YmxhemUKPiA+IENQVSwgYWZ0ZXIgSSBzYXcgdGhhdCB0aGUgb3JpZ2luYWwgaTNjX3JlYWRsX2Zp
Zm8oKSBoYWQgYSBidWcgaW4gdGhhdCBjb25maWd1cmF0aW9uIHRoYXQKPiA+IHlvdXIgcGF0Y2gg
YWRkcmVzc2VkIGFuZCB0aGlzIGJlaW5nIGEgZHJpdmVyIGZvciBhIHhpbGlueCBkZXNpZ24uIFRo
YXQgZml4IGp1c3QgdHVybmVkCj4gPiBvdXQgdW5yZWxhdGVkIHRvIHdoYXQgeW91IHdlcmUgYWN0
dWFsbHkgdHJ5aW5nIHRvIGRvIDstKQo+ID4KPiA+ID4gUGxlYXNlIGRvbid0IHRha2UgdGhpcyBh
cyBuZWdhdGl2ZSBvciBhZ2dyZXNzaXZlLW15IGludGVudGlvbiBpcwo+ID4gPiBwdXJlbHkgdG8g
bGVhcm4gYW5kIGVuc3VyZSBpdCB3b3JrcyBjb3JyZWN0bHkgaW4gYWxsIGNhc2VzLgo+ID4KPiA+
IE5vIHdvcnJpZXMsIEkgc2hvdWxkIG5vdCBoYXZlIGp1bXBlZCB0byBjb25jbHVzaW9ucyBteXNl
bGYgYmFzZWQgb24gd2hhdCBJIHNhdyBpbgo+ID4geW91ciBpbXBsZW1lbnRhdGlvbiBhbmQgYXNz
dW1lZCB0aGF0IGZpeGluZyB0aGUgb25lIGJ1ZyB3b3VsZCBhZGRyZXNzIHlvdXIKPiA+IHByb2Js
ZW0gYXMgd2VsbC4KPiA+Cj4gPiBJIGRvIHVuZGVyc3RhbmQgdGhhdCB5b3VyIGRyaXZlciBjbGVh
cmx5IG5lZWRzIGEgc3BlY2lhbCBjYXNlLCB3ZSBqdXN0IG5lZWQgdG8gY29tZQo+ID4gdG8gYSBj
b25jbHVzaW9uIHdoYXQgZXhhY3RseSB0aGUgaGFyZHdhcmUgZG9lcyBhbmQgaG93IHRvIGJlc3Qg
ZGVhbCB3aXRoIGl0LiBUaGlzIGlzCj4gPiBwYXJ0bHkgYWJvdXQgd2hldGhlciB5b3UgbWF5IGJl
IGFibGUgdG8gdXNlIGFuIGV4dGVybmFsIERNQSBlbmdpbmUgc3VjaCBhcwo+ID4geGxueCx6eW5x
bXAtZG1hLTEuMCBvciB4bG54LHp5bnFtcC1kcGRtYSwgYW5kIHdoZXRoZXIgdGhhdCB3b3VsZCBu
ZWVkIHRoZQo+ID4gc2FtZSBieXRlc3dhcC4KPiA+Cj4gPiBJZiB5b3UgYWxyZWFkeSBwbGFuIHRv
IGFkZCB0aGF0IHN1cHBvcnQsIHlvdSBsaWtlbHkgbmVlZCB0byBhbGxvY2F0ZSBhIGJvdW5jZSBi
dWZmZXIKPiA+IGFuZCBieXRlc3dhcCB0aGUgZGF0YSBpbiBwbGFjZSB0byBoYXZlIGl0IGNvcGll
ZCBpbiBhbmQgb3V0IG9mIHRoZSBGSUZPLCBhbmQgd2hlbgo+ID4geW91IGhhdmUgdGhhdCwgeW91
IGNhbiB1c2UgdGhlIHJlZ3VsYXIgaTNjX3JlYWRsX2ZpZm8oKSB1bmNoYW5nZWQuCj4gPiBJZiB5
b3UgYXJlIHN1cmUgdGhhdCB0aGUgaTNjIGNvbnRyb2xsZXIgaXMgbm90IGdvaW5nIHRvIGJlIHVz
ZWQgd2l0aCBETUEsIG9yIGlmIHRoZSBGSUZPCj4gPiByZWdpc3RlciBhcyBzZWVuIGJ5IHRoZSBE
TUEgbWFzdGVyIGRvZXMgbm90IHJlcXVpcmUgYSBieXRlc3dhcCwgaGF2aW5nIGEgbG9jYWwKPiA+
IGhlbHBlciBmb3IgdGhlIHRyYW5zZmVyIGlzIGxpa2VseSBlYXNpZXIuCj4gPgo+IFRoYW5rcyBm
b3IgdW5kZXJzdGFuZGluZy4KPgo+IFRoZSBJM0MgY29udHJvbGxlciBpcyBub3QgZ29pbmcgdG8g
YmUgdXNlZCB3aXRoIERNQSBpbiBvdXIgY2FzZS4KPgo+IFdlIGhhZCBpbml0aWFsbHkgaW1wbGVt
ZW50ZWQgbG9jYWwgaGVscGVycywgYnV0IGJhc2VkIG9uIEZyYW5rIExpJ3Mgc3VnZ2VzdGlvbiwg
d2UgYWRkZWQgdGhlIHN1cHBvcnQgaW4gaTNjX3JlYWRsX2ZpZm8oKSBhbmQgaTNjX3dyaXRlbF9m
aWZvKCkgdG8gbWFrZSBpdCBtb3JlIGdlbmVyaWMgYW5kIGJlbmVmaWNpYWwgZm9yIG90aGVycyBh
cyB3ZWxsLiBUaGF0J3Mgd2h5IHdlIGluY2x1ZGVkIGl0IGhlcmUuCgpZZXMsIDMyIGJpdCBGSUZP
IGdlbmVyYWxseSB0d28gb3JkZXJzCgpCSVQgMzEuLjI0LCAyMy4uMTYsIDE1Li44LCA3Li4wCiAg
ICBCMyAgICAgIEIyICAgICAgQjEgICAgIEIwCiAgICBBMCAgICAgIEExICAgICAgQTIgICAgIEEz
CgpOZWVkIHdyaXRlL3JlYWQgdG8gbWVtb3J5IGFzCgoweDAwICAgICBCMCAgICAgICBBMAoweDAx
ICAgICBCMSAgICAgICBBMQoweDAyICAgICBCMiAgICAgICBBMgoweDAzICAgICBCMyAgICAgICBB
MwoKV2UgZG9uJ3QgZXhwZWN0IGV2ZXJ5IGRyaXZlciBuZWVkIGR1cGxpY2F0ZSB0byBoYW5kbGUg
dGhlc2UgdHdvIGtpbmQgb3JkZXIKYW5kIHRyYWlsIGRhdGEuIEp1c3QgbmVlZCBjbGVhciBBUEkg
ZGVmaW5hdGlvbiB0byBhdm9pZCBjb25mdXNpdG9uIGF0CmRpZmZlcmVuY2UgY3B1IGVuZGlhbiBz
eXN0ZW0uCgpGcmFuawoKPgo+IFRoYW5rcywKPiBNYW5pa2FudGEuCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
