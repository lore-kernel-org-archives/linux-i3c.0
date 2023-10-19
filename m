Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C24C004C0
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 22:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al0CkoaTqs4r3H7mPiWoNZPBvTPvumn5YbFG6IApgI4=; b=33GRRusn7t63zu
	m8AkF3XvGujMfWOIp+m203WtOdpgSUE655Kc6jCyEoGmd83AEOtaz7GYGXM71VQLcSqQHPUy77X9e
	OcYK/3W473uJwpvAyVYG82vXe1qLSs+/FZJs7BnodfeKVnkAFHYkHR+m8Q3+KxfYF/GyEAFC3ASkA
	/S9KHuip9yV6UWNZddbFT0hICUWz6iLKlUX/iEXraoc6yWqzVMX89BIdpGGyX4KQk1OzcqcVnmZI9
	S0T/S6NZFq1WV7MqLXsx/hVlRiW8prz/hSdx33G7B/gtgpTCVFD6FdY4Si8TeAbsICsmMvfkPLM3G
	EthaOn/cBY0p8qaaBqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUr-000o6m-0Y;
	Thu, 19 Oct 2023 22:28:05 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f400:7e1b::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUo-000o1V-0t
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 22:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcbD2ozq4i8G+fGAfMs1vLIY252PQOclsdB30QEhhIunLIvbOKJKdCNQ+K5E7UkOTVeg/wN0fOQPUQH7sAdPG7AR+bhqBfixhQCyEFv/X6cak1yNFFP+H6kxVpSgYnTETNDx69rdTx1hZOaLSk366W3C+G1OOwyXx/bUUosdCGecXHEKJcVsq1AvgSLFIxeoXiVLVfNukk1tVJGy0wC9MvXRkubD2HJyxhKBuSFQDW86SiuUeIDRsjAqzPziFOSVW0ovvhOAprfUD04m7wMu26SELosMetv/LOk9+qCwnpXT/uuUeXam6yNvmuYh23b+3vUg/3cwz3g/jUikdvV9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT9W7TotJARq6zP26cWXT9hzaMtE+nmkARINED70m3A=;
 b=b/63V16GXMNFxiv9Uqm0LNnA4U2X9GQ95PI1FP3qpddxqv4kkvGj27MOSPgB1g0elbSAhHMEEGgwSU6T0GKN7y9uSnmasySRz+YbOG7pIbXpUMvpnym51YtYoVO/pnPApPIbuQ+CSw1uWQsushOKloZiMSpYWDOQkNG2pGuKdnAtM04k+FYQ7DfZhdbc5od5jPO81BcWn2Mbz0kstO0LdQjQTQ/1NzoBcSh7aUOTreqVWmoGtCp9wRVzxOUnANBMTZ35Q/bZLX6OKq8B7UwBemTQXsBZ7mQwdm2WUZyKl5P4rDeoTS2qWcKF0PWxXbWYDe7RNnuU1pcU5EeY0FI6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT9W7TotJARq6zP26cWXT9hzaMtE+nmkARINED70m3A=;
 b=Bxe7DJXquFtCHIFa5O6xGiLL9FQVC9EUqOEYYh7Q1/U3UYDTbFmLrFnv3faAmDIQj/VvDWG3rQYBdN3Ne73sRi3gVY3C8qnaDhVFfEhytc8PX6wglp8EQA92K65rF+7IiKvrQj4D68rJYMzcheb0ibZ56HMTWlzui+NG5n0lUZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB7708.eurprd04.prod.outlook.com (2603:10a6:10:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.10; Thu, 19 Oct
 2023 22:27:55 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 22:27:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] i3c: master: svc: fix random hot join failure since timeout error
Date: Thu, 19 Oct 2023 18:27:25 -0400
Message-Id: <20231019222725.3598022-7-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019222725.3598022-1-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c9f151-8689-4abb-da63-08dbd0f2a3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j54wbIYDBBUwajZxBlc7TZPNR/NkabsA6+yGcUvJh8WgWIapp9hEuRsj8WyQveStHEO64jNHFjlq0LqEX1tvbHi5mYFzPeZ4YgC0pQ4EE5EV3a7t8lD/tj/8/dRCi4GqeZy6yYhy3jVTHofiYXfCKP3NsuFTnM9gyPwnrHtuy6nqPZeAX3UtQiKQWLIDinFKaQkmRetvq/SlDnSn975Rm2GkDtjCyF/FNN/46/OsM0/MJPkpEocsClkpkiQWMzQ29E0b4J+L1JaooZTetHYE+xhHhvxk2H1aJerGj/3EsTpq4yiMUMEp4y35oLCDj/Ay7WLlzZQuAkUxWpBMwSNWmnUtQqtv/iDrVYxcyDBXJzXVi6q/NzPXMuv9zXCvHo4M3lZlrp8rqyym7lXnnvApyRmZWe9plPNdOvWhdBHXTAq8WkU2yi35uuqnlR0Obherz0pffWub4caFNtqkGQ6wOVPT/0M9ZOLwol3/+z3hMQBjdBHFl7cJ+5Qdmyll1Ef9QaecwJZXfqFE2WpapirFECk3ZMkqrfNZ77DoephhoKvb+POuSru5+402BJFMUK8rIcIPGeN5myXxxUFE124o3Y+m31gusgVoXgb/MFH1tlBfW4NMWJC9XqJ+avdaYiPnatCf5cQOlP+Fr5F9OrIJ1uQsVvo87iHF9kJSSM6UU7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(83380400001)(6512007)(38100700002)(478600001)(36756003)(66476007)(66556008)(66946007)(316002)(6916009)(86362001)(6486002)(52116002)(2616005)(1076003)(26005)(6666004)(5660300002)(2906002)(41300700001)(8676002)(8936002)(4326008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZwd3hmNHMreWhqNGYwMm94dlJWUmtzdklHVlk0YnkzWGcraFFYTzdLY1Zy?=
 =?utf-8?B?aGltKy9MQ3NiTTlkVUwybENrZXM0L3NIa3RzUWVsT0l1VjgzNEtXMnV5czU3?=
 =?utf-8?B?QmZ0REVkMGtHR0IxL3dpV2xNc0FqZGxjdWZuYWI2UVB0cHI4Z3VSZU9pYmlN?=
 =?utf-8?B?RFlqWGNDOXRETmNWZHNMdUxNckhXSVNXMFlTY21qOVBlZldUNEl3S3VwL3JL?=
 =?utf-8?B?bTliOW8zUmVHZkRNQ3d0aUYzK1g4U3dJdnJDY2VYbStWaVBYcFVJdkF0SWVS?=
 =?utf-8?B?dDdxTUNxMXJ4aGlORy9OMFY1aWxXSE16OEhjQ25oWU9Nbk4zd1JXUUFaNWFv?=
 =?utf-8?B?Uml5Rno2UXdHTk0vYnNTeW9WRjlLd1lQN3AzaWUzUjJMQnM4WjV3RXhBVUJC?=
 =?utf-8?B?enV4KzdLM3B5TGlNc0dqMWVhWWQxYUpObzlyVm9DaEpZamUzMXVrV0I1RXRT?=
 =?utf-8?B?b2dndm1TejA1N21EeVNjSTZyK3oyUkl6N0pncDJwSkNMRVEzQ0p3MkpwVk5v?=
 =?utf-8?B?RkwwQlY1MzY4MGZWUytwUHFpSDdVS3ZFeDUvL3I3UzgwRnJoUmtZK0dXUzc0?=
 =?utf-8?B?bXBja0NIZUI4WEEyandUcUI4M3FrSU5yWFViYlJnbVNoNDk2V1lrMlM1cHpE?=
 =?utf-8?B?bjROV3YxVC9lNmd2VExWTytPY2VIU2ZEanFHMmlEamFuVVRPMzRGQ05sYWhp?=
 =?utf-8?B?aXMyOWpwSGo2TkYrOXI1UWJCcnZNdmlySGoxVFJJODFyd0E2UE8wemRvWVc1?=
 =?utf-8?B?WUFTQUNiem5tQ3dqR05GRng0ZDBVMGJrOS9NTkwwTlJnVHcyTk91UHNrZkFz?=
 =?utf-8?B?Y2lNZUhGVFc1ZGt6TXR0elRVdmt3OUtjMFVIWVVLSnluS0NKaWVrVVVGSWVw?=
 =?utf-8?B?S082VlM4eUpWR1V3a3FLQlhNRTZOVFRVdzN5MVkycXdScVptTWxncTJDb3Vp?=
 =?utf-8?B?NGpqNjUwWGp2MjlreEg5bHh6dGZtRU0yN3pVMExrYklEV1h6YTFLMWFUclBq?=
 =?utf-8?B?bFhlQ0FGK014OXhwS0twVVdZKzFJSnVDNjRLN0lrb3NZODlzYWJFOVRyRDVo?=
 =?utf-8?B?RDdOVWI2TnZabURvSWJjem92SUJoNUN6QllNNUV4U1JSWjd4bDlJN3FuSTEr?=
 =?utf-8?B?N0MvOVBRV0hBb1IzL1BJZkZiTHhqQ0NNdSs5dUpXbTgycEJEWjZCWElaNDF0?=
 =?utf-8?B?clEzdFdNUlFQNDhCRnBvSE1KOElqQmppTVc5LzlaTUExQWZvV3FyRU1sOVhD?=
 =?utf-8?B?TFIwV0xidGF6VjVidE9iL1hBVzhlWUJRcldsMFNUa0hhSlZLYUdZV0VqTHVK?=
 =?utf-8?B?RllOTHdGWTJJNXo2Q3R3eGg0NnNPTDJtSnRRTkRmOEJEV3J3SVJ5dGZTVkRa?=
 =?utf-8?B?NkJiUll6ZERmTnpmUURzYWxrOWsvYnRrZWN5L3M5ZkpaOXFrVjNlcU1BUWRm?=
 =?utf-8?B?bHdZQlNRbFAxUGczTlh2QndWQ3pHQlRyUHRrVDY2R3JnVnNPakhtb0JEWnc1?=
 =?utf-8?B?V0lYdHo3cm1iRjN1VGpNVEdvVklGV0hrRDNWUmJXdHBhRm50dUpKM05DRVht?=
 =?utf-8?B?TU04QWdSNDZnczFGVHZRUm54amxCb1ptUXV3M21VYS9TVXRDOExzNEtLUVZT?=
 =?utf-8?B?cnpDNE1JS25VNVd0U0o3ZHlINThNNlNJUkZ0aUJYM3FzV2kxY05hRWtndkdr?=
 =?utf-8?B?a2tNU1RJQUZpbFV2cGhPQTJlT2t6eFpzRHNLbGdhK2JvL1k0a2xlN3FKbEpF?=
 =?utf-8?B?MTVkemErU25nTmNEY3JNQ1JhRElsUnpZeFJ0eWxQQUgwT0RpcStTeFl4dUxz?=
 =?utf-8?B?WlZTZFZZYjZJY1Q5U0xGTzVZZm4zOGg4NVM3UkdBT25iRmlUWWFVQlJzanlG?=
 =?utf-8?B?OE44VE04cU9oakVxcnhtVVkxbmZJWlNlbnp2WVpTZitPOWoyYU1tUVJDZmtH?=
 =?utf-8?B?VisycW9JdFdPRVVTTERob3hBV2UwQVRSNmhObXNGekoxN3luc3FMU1lTR2kx?=
 =?utf-8?B?WjZzODlWbTZRTlBockkrUmMzamQxS3JUbXJtQjZuNlVzblBFSXhQbm5qOGow?=
 =?utf-8?B?R2I5TUJFUFRZT2JzN0k4VTRSZ1pSWE0zZlU4L09VbjV0TDI1THJRRjgrVFQ5?=
 =?utf-8?Q?P/cg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c9f151-8689-4abb-da63-08dbd0f2a3e3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 22:27:55.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLGqUoBvhIWqRM8s0+wE1zLPocOa4pJGZs/YivxpM6xXt4QlKjV9KvRhPbUS8y8Xp46ObiGKqdrg4gOw/zRbQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_152802_317649_F900F39B 
X-CRM114-Status: GOOD (  11.15  )
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

bWFzdGVyIHNpZGUgcmVwb3J0OgogIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5pM2MtbWFz
dGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4gMHgwMDEw
MDAwMAoKQklUIDIwOiBUSU1FT1VUIGVycm9yCiAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28g
bG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKICAtIFRoZSBUWCBGSUZPIG9yIFJY
IEZJRk8gaXMgbm90IGhhbmRsZWQgYW5kIHRoZSBidXMgaXMgc3R1Y2sgaW4gdGhlCm1pZGRsZSBv
ZiBhIG1lc3NhZ2UsCiAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMs
CiAgLSBJQkkgbWFudWFsIGlzIHVzZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLgogIFRoZSBt
YXhpbXVtIHN0YWxsIHBlcmlvZCBpcyAxMDAgzrxzLgoKVGhpcyBpcyBhIGp1c3Qgd2FybmluZy4g
U3lzdGVtIGlycSB0aHJlYWQgc2NoZWR1bGUgbGF0ZW5jeSBpcyBwb3NzaWJsZQpiaWdnZXIgdGhh
biAxMDB1cy4gSnVzdCBvbWl0IHRoaXMgd2FyaW5nLgoKRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkz
YzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5j
b20+Ci0tLQoKTm90ZXM6CiAgICBDaGFuZ2UgZnJvbSB2MiB0byB2MwogICAgLSByZW1vdmUgMTBr
IGF0IGNvbW1pdCBtZXNzYWdlCiAgICAKICAgIENoYW5nZSBmcm9tIHYxIHRvIHYyCiAgICAtbm9u
ZQogICAgCiAgICBDaGFuZ2UgZnJvbSB2MSB0byB2MgogICAgLW5vbmUKCiBkcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwppbmRleCAxYTU3ZmRlYmFh
MjZkLi5mZWRiMzFlMDA3NmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkz
Yy1tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwpAQCAt
OTMsNiArOTMsNyBAQAogI2RlZmluZSBTVkNfSTNDX01JTlRNQVNLRUQgICAweDA5OAogI2RlZmlu
ZSBTVkNfSTNDX01FUlJXQVJOICAgICAweDA5QwogI2RlZmluZSAgIFNWQ19JM0NfTUVSUldBUk5f
TkFDSyBCSVQoMikKKyNkZWZpbmUgICBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQgQklUKDIwKQog
I2RlZmluZSBTVkNfSTNDX01ETUFDVFJMICAgICAweDBBMAogI2RlZmluZSBTVkNfSTNDX01EQVRB
Q1RSTCAgICAweDBBQwogI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX0ZMVVNIVEIgQklUKDAp
CkBAIC0yMjYsNiArMjI3LDExIEBAIHN0YXRpYyBib29sIHN2Y19pM2NfbWFzdGVyX2Vycm9yKHN0
cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyKQogCWlmIChTVkNfSTNDX01TVEFUVVNfRVJSV0FS
Tihtc3RhdHVzKSkgewogCQltZXJyd2FybiA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0Nf
TUVSUldBUk4pOwogCQl3cml0ZWwobWVycndhcm4sIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUVS
UldBUk4pOworCisJCS8qIGlnbm9yZSB0aW1lb3V0IGVycm9yICovCisJCWlmIChtZXJyd2FybiAm
IFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCkKKwkJCXJldHVybiBmYWxzZTsKKwogCQlkZXZfZXJy
KG1hc3Rlci0+ZGV2LAogCQkJIkVycm9yIGNvbmRpdGlvbjogTVNUQVRVUyAweCUwOHgsIE1FUlJX
QVJOIDB4JTA4eFxuIiwKIAkJCW1zdGF0dXMsIG1lcnJ3YXJuKTsKLS0gCjIuMzQuMQoKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
