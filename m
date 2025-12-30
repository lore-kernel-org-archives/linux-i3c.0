Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CF4E95A6C
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Dec 2025 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TA+K1Ad+bE65lerdH8PA5R+hkrPrFGoRhIjQaTOPuAs=; b=WGd+amCfDZgza7
	z1sAK5uB7iSrlh1H4u4p7qub7WvFT76E+ObQkbb5qFvb+ox+TzhDPxbBU6wpmM+rdwHHF2QpvncGd
	5I+fwoiSyiFEIPMS4BGZTexGR50/FDtr/BRET7AeXvU0EAb0qxpFsKzqgRi9sYg2tzTsdPC5hPHJF
	Pq+Gs/CpC4/FO8nukPEOk8hlhXioZmJjyTGNmEPVZeH6y5/bmsWVFXOHAYqU/zcO9JEpL/lUjh0rA
	MPWal1OVTPIO7pJZvV1m8TeB4pzjidJJCHAGXMTx2wD1/retIwLC6xEcYIPxzap02e/w2Hk85EgW8
	3hrU/pzGZ1B12IF24dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaX9j-00000004ix3-1ZYg;
	Tue, 30 Dec 2025 10:40:47 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaX9e-00000004ivu-1OzD
	for linux-i3c@lists.infradead.org;
	Tue, 30 Dec 2025 10:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FszB4R+EswiQ/kq14BE4n3PytH6HwAxzNyFLhvJu9x6qtUNP+7Tu5IgCsD6Aa1csYo6wchr1kJws0Z5nxtde1zHMUlITotkm9ooNBKq27RdUcp4b6X5tcabEogh6NCE48c89btnYKPOgUds4aBRm5m0bPxEHfWla5yiclLBC6aE53LGq+ABjP/CtrlV3iLm5WnvvTwfkYNDflstKNe0DGyQRJT8fN4frV5DEP7cbI8z9S8sM9NVGPa5F3r83B6tjiMuVytxOjSizJORkXptRy+t+UxSY93aGw13ids17DzHawdcOzMC5o2lk0UUQiXEeSm2Cbjwu4FYZJ5F9MMBybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYerh5u4Pv3S40tdj+lJPOqaW4mvRl7+C+LobcE6e4I=;
 b=G3Sjdt8LoY5GVqKH5ZfbSWUUuxo9qEziqaN1YYfVOvklDRDns3akMgBQjfBvxBcvpXzatZVSkG5pT8pxiI3Ip3crcrfjjDIbRYqMBEz59YZn/erc8a+h1GCw+c1iJQ3btk7HnOLLDefLgmNt6Dm0r3QemKj8VrJhHceYBMYahAmDY35a8/48mKodPdxaE2lw07ueQQjksumrzu2/oBWWNssOb89rgpa8gisjH4mAdSIgtLDqhPs4JG+PKWJ0AXbsoa2dyUAvKPi/G6Lc6rtWJJKSIZ7LkKPP+1NOJua216oxZXWvFBIULDm35hhqbqk5WhYjHjKUYOVJynWDukT7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYerh5u4Pv3S40tdj+lJPOqaW4mvRl7+C+LobcE6e4I=;
 b=FL01P9cabgmoACTy3bGGHHt4psmGQBcB7jmln11e4nTr2i22go4SLGeRQL7rNUdeuuadPb2+m47vPlowaM/Ls4oIziaIM2RCR8Me8Z79YHfc5Ft98YMj5NVgrahRaCor9zcQvB26YGwEQshqQmvmPPF6B7RDXdkvJz6okQVrvjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:18 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:18 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] i3c: renesas: Add suspend/resume support
Date: Tue, 30 Dec 2025 11:39:35 +0100
Message-ID: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB13563:EE_
X-MS-Office365-Filtering-Correlation-Id: 812f0381-38ca-4e20-245c-08de478fd2ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pqTqUmnBzfK6vXtJOYyg8/o4+K18GIzpTUv4EfuGAxKj6TCe8YlhndXse69o?=
 =?us-ascii?Q?N25eeeAcjPDNSlriTV7er/Ll3ev0il0BAaXw8H99Qa+HF4YGnXajsjEeAoq3?=
 =?us-ascii?Q?UHBGJJbCvP1Q5sURJdUGnP5k4aVbVn94xQVSWGSegH6Ig5ZEYh62j7uZKa7v?=
 =?us-ascii?Q?aZZfG5F3mVQmYiopP1O9cEOnzR7Nc+KOiSB8y0EGfmYGHpSAt0VPtswpntry?=
 =?us-ascii?Q?0Pm/MQP4lpPXODP+a1qzkoYQTsFif/+uCT4f8WJnMqc5LvBXXNmKsvpkffwZ?=
 =?us-ascii?Q?9vMw5E3TOjl/7Y8CKXWlmXnJx6b6VoQg6q3SgEMW5j/uZ0gv+mt9BZ5e1Loe?=
 =?us-ascii?Q?bZEVltoL5+m3Nheyn2u98LHMbQcrsUInSCvyIlZb0g78QhW0ZdSvr84X08QC?=
 =?us-ascii?Q?dJhr/wkmE0+VbxKnql1w/jz5yY0PhEyc4xQEJ3OiK9Xl0nlmg5pWWVCDKBPk?=
 =?us-ascii?Q?zFSJ1KCo+KJh7ooZoK2UWZcwSNkTFplfAqKrQijbHU/q+DP94XKtAQqSpzxk?=
 =?us-ascii?Q?XkkiXvBUrO5iD0oY1V56cbRbLswDN97oQRsSWbscx2EcRvnQokJR/BTN1wCx?=
 =?us-ascii?Q?fTwLJIXHxIS6tdHZvsr5j2R9e5HSqxXJaLxA48hS6A+RX87hkkEh3Ch+K2rZ?=
 =?us-ascii?Q?Z2sX0LaL1wuOyrgNUGI0QgHhHEJAuEd09NiGGQv1VuFBQT901GJPw5G7NV2l?=
 =?us-ascii?Q?vOHu8j2p8GDrPEMbyQbq57e2AjCG9YC8muuK+qZfOJEBPoouK8tO3dKfzDmP?=
 =?us-ascii?Q?AeGIvfKpurVOia8OPGwmoXTVtmDQkniwHpSNEwtWVCEbgYJRFYDERHKK8Y4e?=
 =?us-ascii?Q?4jc6UVOh7CIeHHW8uQxKzmRMENZKFAHukpLbKaYoEqlc8obNrEFs00y/VsNp?=
 =?us-ascii?Q?R4uUf+YJTcFVF02HwypbiaeIt50SkVAHhbvIHHvRZufWJ8j1gcrqQDk0+ts8?=
 =?us-ascii?Q?zRveFpMXIByiihAX2yWvS7IhCGSrlBaQLnQ5E2Q/JR9Yf47cAjNHGMslrtMU?=
 =?us-ascii?Q?bEU4Defa+v2r6MncNbmXmZhGsnbbFmfh/rOckw6uvUW2C8MZOdNeQfACuqmP?=
 =?us-ascii?Q?3BaYSOaE8rQLN0BzlopEJFHqQw4jgGIfpAGdYqto96E7Ur3xJRjk/LYhk2By?=
 =?us-ascii?Q?H32LR7cZfvSHMT/6T6oFWE15zp3sEucUzi+3Fq1Mb8prc8unYeJ+Jmu+lBeR?=
 =?us-ascii?Q?5i7A9f6GiYb3HpytfBEiv0BOFKk3yLhqfgxRWKMrhAycrSGrtJqdI4j2iJqf?=
 =?us-ascii?Q?9XoxXNJ9jJZfqnQpudIW34XJPp6yjlS6XKfH2Xp2TM3K6zIimrlvxY8edyCx?=
 =?us-ascii?Q?/VC2gezkUXTgHFaxMneDuhJchFanMZAw100eztTYBxPbuqrqGnbKc7mZJaty?=
 =?us-ascii?Q?kAXIYx1jskPeXRmn9idRAdhARy5BRWRjrwPUZpjYIAeOruCVhzQE5FVrxnOD?=
 =?us-ascii?Q?SkrKQH/bPbGATf4D/Z93CAviF+5RnYC9RCuhPQgly4/E9s4JypqqExr/2D0f?=
 =?us-ascii?Q?545yBCJ3o9hH5KiupJMjujVnvqMXaAbDip4J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbsOD7PZtwVLOYItTwJO/qb2AfNU1FmeEIlzmfOqzikUeMyjR4Y29VjRyfS5?=
 =?us-ascii?Q?wQu16x+/yyc4raOBs6co/f2M0Dwp4LQzIoqLo/Fi+7hqfAZayDi6ppQgFt8A?=
 =?us-ascii?Q?qy0a22f7ElbMFu46hAUMzUr3VC49D/vQ80XGRNq+XrT716gP2tcmMo9/FqiM?=
 =?us-ascii?Q?IaVMIrhlI8U3ZL8tieBsw/dK57mUIrt3MiWVavAHXPJz18DSnuRxX9eLDLBs?=
 =?us-ascii?Q?utETz9l3UWonfcoBI6HsisG9GIZu4c0oszehX27840CG2WtfODl4tFjnT8M2?=
 =?us-ascii?Q?Xgj01p8nLXk+QrfJasIpFcqcP1lUloIWXYwXBh2+h2RZHvWClL5n4XyHZqI0?=
 =?us-ascii?Q?wD0yw4V8mUpbzgfX0i/L4l+YeRZP0zc/OMj/YOJ6Yc2mCZP53ZlguI6M4jY3?=
 =?us-ascii?Q?VPegV8y2cAuxoLM3I1yXYiBESbkdX8IE86QJW1GBZC3nYFqvr1v0uofu6i8N?=
 =?us-ascii?Q?WeHulhAqR1Qe2u76JAcrx0u5mck9Cqt2toc1Fio+VlUEN81sDhoJ/aBuB52E?=
 =?us-ascii?Q?/rBhgVMHyW6yD/QChFbV3Zw75jNiKsTzUFQK/hYX3NzwNYzGJ+wdJFDaVUw0?=
 =?us-ascii?Q?whuEye+WtWwijTYz1EJ9UAoGsdCeSfb0wxfBscoNQi17WFsyvwnqI4hUjDJm?=
 =?us-ascii?Q?wRiMn+k6zJmxUy0L0fKzz8yVWuIhMDILCO6MMYeGgR2N99DJBnzTl3LvHb+O?=
 =?us-ascii?Q?2zIa+apv5bcT8lpb9r4wvpxDh64BnrdqRr6+vt8l0cT7PUew6+pAYucb5bpB?=
 =?us-ascii?Q?uNp30Clmf6wTEJAQMIV9mSwKqqnTboCcXKzM4g6Vz9I4Jy6TsEtjcRVGGh6i?=
 =?us-ascii?Q?g4ZjAh6B5kH1QpsNjyK9pwkD1O/9A9s8UvF26GLdamfWnmpPyh1pzEbA8QHO?=
 =?us-ascii?Q?Fif2O9U+kkKShVaedA9LVGwgRv2TmAjIN/iCglPezjDwv9MMj5c7kkPWml8m?=
 =?us-ascii?Q?STUeRmPopZ8DH9dI6ZEC7F7jJu3TDdBbX/Km3kjiU8//zG1ONuDL7NWn5qeC?=
 =?us-ascii?Q?Tc+2B+ja3mtKVB1Fy26/9FdAsxbN3cttTxpxOK6abWpfDruGFKS5cZqBruvD?=
 =?us-ascii?Q?155/M88ktGDi9WtfoND0pzx2RkZ/qmeRiHXma8hQikD+CmMtxbF0Wk4CLdrY?=
 =?us-ascii?Q?1B51QwdtFfsTR81dXM+8j28TVkoKvvdgWVBizUaCbk7cG4CHCoMEZABurzKw?=
 =?us-ascii?Q?D3PhJa/hekk3o03gNdll6WxVZHpJK3URf/6A2tzwX6AyzYV1cF1bDQyvucCn?=
 =?us-ascii?Q?QzOrzmGbLIJ6bLSOI/LVzRJovScWm2QBp562cNso31y9FboA5O8jRWY/Kt5z?=
 =?us-ascii?Q?CB3IKLQXxNPqqdl7mYDK0FE5cG3FqnqVIBmGdpReMyE12r2Oz10hDivc5c61?=
 =?us-ascii?Q?R/BnZXdNefNlzC7zSdGTScOQNp4KwqOvEWLAXXNANFozLDk1KOdm7z1QkvN5?=
 =?us-ascii?Q?1R3W6SUYipzIr2+zIb9ymo8s3BW0sYgPiRfx2EOBM6xpJo3oKhr6AmLAJ53w?=
 =?us-ascii?Q?j5BiPUJDvvWEWU9ONCD7l5kp+BlQOFY8nLErLkbeBq3Yv7ov0M4fVZ1Qs820?=
 =?us-ascii?Q?N7wcZ99IeckUgrT5aPpOqlziBTyAo51kUxOOWt9K0t/0AH9NLdHon9RwHEnS?=
 =?us-ascii?Q?i/YTsF6gz9Jjhi5Q741C/fcTvZV6rtu5JQgJo6F/zA4O8fvdEi6Qc+4wRE3A?=
 =?us-ascii?Q?Bvvr7eBUsYQSP1h4h6Yj4V89EXZWfqWrc0cBK1r8hVR7GoKbdGEYuCe69HrG?=
 =?us-ascii?Q?xtNEjQh+lMUrFgb0Y7e2QsB00ZAMw30xVQkENxEYrgPulC6AG3rI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812f0381-38ca-4e20-245c-08de478fd2ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:17.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSvtJB0cMqGsBE5NJqCWDyxQHPAWoXqHqh12V4AkIvXXBHUxqqvqGxe9YFtISKBwkYyTxYUvVv0Fiawln5Lde8MZYnUgE5lXAsCqtEQMhlFARMr2rkrSMv+6cEg/c180
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_024042_377075_9F08C64F 
X-CRM114-Status: UNSURE (   6.01  )
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

Dear All,
This series adds suspend/resume support to the Renesas I3C controller driver.

Thanks & Regards,
Tommaso

v1->v2:
 - Split patches into smaller chunks.
 - Use clock bulk API.
 - Update patch 4/4 accordingly.

Tommaso Merciai (4):
  i3c: renesas: Switch to clk_bulk API and store clocks in private data
  i3c: renesas: Store clock rate and reset controls in struct
    renesas_i3c
  i3c: renesas: Factor out hardware initialization to separate function
  i3c: renesas: Add suspend/resume support

 drivers/i3c/master/renesas-i3c.c | 257 ++++++++++++++++++++++---------
 1 file changed, 184 insertions(+), 73 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
