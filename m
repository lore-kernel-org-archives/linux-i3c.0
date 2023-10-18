Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C52CDB486
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/03raLpHkFpBZHbL3x7/mxMwSA0r+c2IOm5t1zdeoI=; b=DoZqyZz3g9CaPY
	P1eCPtTmq7/LJFA80DvCv+ZcyjDa07G1z+hz9yPK+g4KqaM6X98tB6urIsIDgNENQZG+39f9QLZnT
	At2UbCKm/s6mapf+oJLADkD83vzg11Msid8MhzewyHlql6S+ebzqM3sU44N3rfpc/rZn65mkUxJHT
	L0nEcBZjMLCaT86sfpesayZZCyTuWSXRCIWPsNM3jgZZo8VmjL0f19IMm4g89s1vCucsYdOAYXZJt
	+kSxTyXPGg4SuYE+lkf4VA8nTTgaZzRqE23lEqgQii4gl71BKL3Z5VRgwlMK9R4vW4a5wtrKJDYZ6
	JQD70UHxLKLJ9jS54EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8mw-00F6Gp-1Y;
	Wed, 18 Oct 2023 15:48:50 +0000
Received: from mail-db3eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0c::630] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8mt-00F6EF-2s
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 15:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afqTGQhBV+S01vmLED46XIzuai5p/fUBdGYFZg+zJTmUFIlHaz87EyVaKcDwzgoKJthCs87gmPNurfdGoqnKRmm7bjRco/BXUjBgGv/vHPJqtILG2p/RgMOCB/xa22jpfeTg43oqNodwaHeOxzBABLJsXP7zaB+SgNoFlFaF9Hd4pQaRqU5LcX1nRrkrTtZzKSsOhBc0t1Tjf/3ZoLAnTjgxcA/htgjhoMsVmarWui69OXU9uxQEWAwuvic5p7rO8dvuECmeXVK7nhtStQjxUDQbm23aujMFYCNkpNKxuO0WM0lXOlIJ/Yt+T1bL9GdIEolwnzLMPPLFbi1jJapCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=AZB8u7/PU5Esj3h0w3ySjWfj6elivLpYHUqpyJIS/lnjCTc/HfNlHE04BdbjH0JMMLbqHk6cK+mTAlyKsoK8vrNF6UDwgm8+cFy7uAO1TpQR7eJQqBdW3Hp8z0Lr/pxcYdxLd3JVmwG7qNYzuEF9GPaTqCo66dj/M/gCvbSsVJsttVVzBPdkrOtMxQF9rJLUch/qyufm1qoPIJC7t4HLN/X5GAiKA4Ev+QUpzI2NuMKqyJnKOJgT/VomRHYFJ/eMhFbNWN7YrGNm7I//DWp0lO5C4HIo6heF5GmMmJ6oA/YW+zDrZ5PQFXu7GpASFVwOK6EWwHKSjQ1GBuU0v3/VfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=BQSHst45l4vP3VRu43j9WQfpoakSpnUa3oogy+JyqHX+vnLO29cHCSpDQJfowaWGIBlsSjJin+EdhVpzGASes8Ll1Z8hajw2CVLPQtzBsmMZvSWqEDSEYhFdcCNEh7TbufPGsB6ht1q2OCU6AyZKh5NURR93xaDnOI9wvOK1Xj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB9777.eurprd04.prod.outlook.com (2603:10a6:150:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:48:36 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:48:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
Date: Wed, 18 Oct 2023 11:48:06 -0400
Message-Id: <20231018154809.3304558-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018154809.3304558-1-Frank.Li@nxp.com>
References: <20231018154809.3304558-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e79c569-37fe-446e-ffbc-08dbcff1b00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3pPO8fogqbRA8hyuXJwsLvPDK4fJ5FAH5cfIv6U3kL6WBsfBMhl+SnwG/wXbtUYVvE7kn7fLcQjP/ihem5fyCsFdacu4OMoLtfDENfLR3pMjKV5vuuN0jAS4L5hYbOEImQxiN0jnszJNlq1jrEatMwsz6EH1daqB3vAQgkWEWExRvK5mY9rpsQ77ivUFTdNOraA4EL5l3I5IsydGJTj70j+Ng4vK6PD+jL2Wk/eljIlbS0tlX5l03SWzIw3V+u3DKz7GlxdIVEWNXuN3HWwphISmqHP2/1Unqi36HqjKjhVXvVIHvtXnuKvNznKsyUJP5ow1cRMUkqpLNZ+f3CuO3gQF4jJvunWNhQNIYiS9EsJgBu+n7IWcR7uO/m6pP3qaboMf7HmsQfgV2dhAMnwg3WM03hkklMbj/7O1ivU9ywd1hG8Vu6EF3qF6HkSkROvRcbM/8nADPF7/xfKD2sEs5UHC8So2y1Cg0ihdEWi14VD2q4/sFEOn33B9hzh4R0oPHOnEO8A9stFRRaGM3fCBjK5V5/ms375pWvWkkZSWaQbefJ11IvvT8JO3+fDGHz6plSTAWOGuFsbgNXH4YRuh6Wp5h/lrZ/PrQaMxz2/RLgNZmtb4L6xVXlDpbKB9yEv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38350700005)(52116002)(6666004)(6486002)(6506007)(6512007)(478600001)(66556008)(6916009)(66476007)(316002)(66946007)(36756003)(2616005)(1076003)(83380400001)(26005)(41300700001)(38100700002)(5660300002)(8936002)(4326008)(8676002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNYQ05YUjZRZEpISFMwZzkyRENweEJwc2NoTDRzNStYbTZmWHI2Mlp5K08w?=
 =?utf-8?B?bk1jTkdyYWdWNmpsbko2NE9YSm5JMHBDdXNPNmEwMkptUkVBdEdTc0pta1ZN?=
 =?utf-8?B?WUlGblBoTzZCUFlxcGJYK3NMQzU4cmRqYXpiSzJrSGxOSDFuVThKbk9CemdH?=
 =?utf-8?B?dEdUc3BqbjZFVUM4aHBJb2lRSys3T0FPYzVyOWtZdWV6dGZweUVBT2dMR3Js?=
 =?utf-8?B?OU1OOVJ0aG13b1BlV2lLMUdiR0FrNmpxTjFGSXFoTkJLUXF4VWtDYlMydE8x?=
 =?utf-8?B?WTZQdDNHQ0xwelhOd1ppRlFqcW5iYS9KTEpjT0xCbFVQVzR6UDNsbzVTMU1m?=
 =?utf-8?B?QnovMmRHRXhnaDNIYzBSaTc1TEhIc2loTFhXd2Ura2VSNGdSS040aGN3WWJI?=
 =?utf-8?B?WE5BcldiRFp3a0ExeWM2VEVHUFl5OFJRWFRTWldldk5DMlNpZjB3QS9sdkRT?=
 =?utf-8?B?b2RPbEFxQW11U3BUd0lNVkdtRWlhdGpoMDEyZ3pzaWp4Y04zcHcwbnVPSW1h?=
 =?utf-8?B?TjQzYzBSVjBweUV4MTY0cWx2aUpjT3VCdE0rN1lmUTU1VUs2TGsxazVmdVli?=
 =?utf-8?B?QmhFZEZDU0FBSUk0V2hKYktnUEtKK0NMc0JrUnZmS210a0hZV1FIWFV5MVVP?=
 =?utf-8?B?QS96MCs1c2Z0WkxDNUZ5eHcxdWNzMERJUGpmMnduakxxSUN2SnpHM3RpNEVZ?=
 =?utf-8?B?UW5ZSHNTaElFVWNwL0hITjJDWkxEWEovUUlMd0x0TmZ5bGJVdS9uRlFsNjN0?=
 =?utf-8?B?WnppS1ZJdTdMYUFIVDY2dWZ2OUcvSzErNFJmNmRNc1Z2QXZmb2lKMTh3R0gr?=
 =?utf-8?B?YWJMNE5FNE15dk1rQ3I4TjRQRVJ4S1A3OXRMUkpKcjVYUUdhOHVnbkFNS3V5?=
 =?utf-8?B?ai84MkNEUElwanZkdEsxTFh3eDJDNTlKOHJCbytNeE1Fd1o1RFlXWEdPdnVY?=
 =?utf-8?B?Wi9wUnpDRVMvU2FqZW9WVzdtb2RRNUtCWkdrRzZDQlVzUHpJOURwTU1iV0h0?=
 =?utf-8?B?SForbGhBcWx6SWc0ZGJRZ2xuWTBEVFNuOVN6M2U1RkNldnZFREVSU2I5eHpo?=
 =?utf-8?B?QS91Z2dDdkJ5NGJjanFreXFPV2FqYzN6WkY1OU1tQTN2aTNJbHVYbXBLTjUz?=
 =?utf-8?B?TlFYS0FvcDE4Tk1uaGpXQWZPLzU3VzRSbjhEcDM3bDJUVllxRGRLNTBzWU9z?=
 =?utf-8?B?OHhyVm1XVEV2QkZZb3RtemtYY1ljVnRFb2hNcDBtZXI3ckhpc2pFR2U4NXBz?=
 =?utf-8?B?VGRWVVkrRFhJOHFweis1QmxGU3lrM3NuREQwVVZpTnYzZmJ6dkN4YzVBR3Bz?=
 =?utf-8?B?Z1BNNkZOODBqS3JUMGxCZnhYUWEybzNtNWhVUERnR3NRS3FPR2hxbURaSGdO?=
 =?utf-8?B?MytKbHNwWU83a1owZzlqaTVjVnJONk9JdGlZbDVQbXoxU0pDTTM3SW50bWcz?=
 =?utf-8?B?YzV4YVR0S0dsbEdOTTRMMnc4QktIWWw4TEptWGI3WmFCbHFOdVFRRmpTSXlW?=
 =?utf-8?B?dHlwWnh6bndWbG5hbW5HRUFQOEUxUDNoeWppUjN4SSswRGk4d3lLbEZhUC9O?=
 =?utf-8?B?d1hXQmZEVmlVVUx4aFNreGZML0tla3ZEalZsZ29yMy9JeEpDZHRJRTE4Ykh5?=
 =?utf-8?B?b1kxb0RNOENpRHJONnJ3Y0hycTVJdFBXRHJ2Zzd1N3Q4R1NwbjdpdkJtYytl?=
 =?utf-8?B?TDVQYjNlRDF6T1lNdDhKbXhuRUE0NDFwOUVHS1NyYUVxU3pCdVlOZHZPekl5?=
 =?utf-8?B?UHZ2T2lxcTVOdG5lNHlOYWZUaFYrUUM3dzJQMWY2SnlzTTNFM0RaZ0dTZ1Bu?=
 =?utf-8?B?SkdnbnZFbyttS2pFTitKUFZ1ZG9Lbll2M2hDTUkvVkViUHNGVVpPdHRGbkdT?=
 =?utf-8?B?WjhWeldGVlBWOGdESTBSVEhxaHJmV29PcFNoTWF0MGJreE1xYTRrVnhMSlBR?=
 =?utf-8?B?ejRUZjEzNER4ZFVvRTFnMHVHeVByZ2dBcytReGVGNWlWMFlGeUJ1bnV2Yzlt?=
 =?utf-8?B?WGhiWTNQb2VEUjIrMndzMjl6V3BRd1IyMEw4K1JlN0IrZkc3dzJ1Y0xjZUlX?=
 =?utf-8?B?dXlUMk1ibktYVzFJTnd1UWVVK0QyNjdqMUpVT0tiVGRpaGZrTThtYXovaklk?=
 =?utf-8?Q?d+Q7UmyT/HhyZMqDrAEuUi6R1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e79c569-37fe-446e-ffbc-08dbcff1b00a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:48:35.7675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr8YtR3ICoQoXqSYGm4VOWefbS9VGz6RDy9MJDZM6fElBonGCflxgW34xSiKG6A6TldK2Wdld4A08LEwdIpq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_084847_932132_815ADC12 
X-CRM114-Status: GOOD (  12.43  )
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

ICAgICDilIzilIDilIDilIDilIDilIDilJAgICAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQ
ICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAg
IOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilIzilIDilIDilIDilIDilIAKU0NMOiDilJgg
ICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKU
lOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKUlOKUgOKUgOKUmyAg4pSU
4pSA4pSA4pSbICDilJTilIDilIDilJgKICAgICDilIDilIDilIDilJAgICAgICAgICAgICAgICAg
ICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAg
ICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAKU0RBOiAgICDilJTilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCAgICAg4pSU4pSA4pSA4pSA4pSA
4pSA4pSYICAgICAgICAgICDilJTilIDilIDilIDilIDilIAKICAgICB4eHjilbEgICAg4pWy4pWx
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKVsuKVsSAgICDilbLilbEg
ICAg4pWy4pWxICAgIOKVsgogICA6IHh4eOKVsklCSSDilbHilbIgICAgICAgICAgICAgICBBZGRy
KDB4MGEpICAgICAgICAgICAgICAg4pWx4pWyIFJXIOKVseKVsk5BQ0vilbHilbIgUyAg4pWxCgpJ
ZiBhbiBJbi1CYW5kIEludGVycnVwdCAoSUJJKSBvY2N1cnMgYW5kIElCSSB3b3JrIHRocmVhZCBp
cyBub3QgaW1tZWRpYXRlbHkKc2NoZWR1bGVkLCBXaGVuIHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZl
cnMoKSBpbml0aWF0ZXMgdGhlIEkzQyB0cmFuc2ZlciBhbmQKYXR0ZW1wdHMgdG8gc2VuZCBhZGRy
ZXNzIDB4N2UsIHRoZSB0YXJnZXQgaW50ZXJwcmV0cyBpdCBhcyBhbgpJQkkgaGFuZGxlciBhbmQg
cmV0dXJucyB0aGUgdGFyZ2V0IGFkZHJlc3MgMHgwYS4KCkhvd2V2ZXIsIHN2Y19pM2NfbWFzdGVy
X3ByaXZfeGZlcnMoKSBkb2VzIG5vdCBoYW5kbGUgdGhpcyBjYXNlIGFuZCBwcm9jZWVkcwp3aXRo
IG90aGVyIHRyYW5zZmVycywgcmVzdWx0aW5nIGluIGluY29ycmVjdCBkYXRhIGJlaW5nIHJldHVy
bmVkLgoKQWRkIElCSVdPTiBjaGVjayBpbiBzdmNfaTNjX21hc3Rlcl94ZmVyKCkuIEluIGNhc2Ug
dGhpcyBzaXR1YXRpb24gb2NjdXJzLApyZXR1cm4gYSBmYWlsdXJlIHRvIHRoZSBkcml2ZXIuCgpG
aXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1h
c3RlciBkcml2ZXIiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Ci0tLQoKTm90ZXM6CiAgICBDaGFuZ2UgZnJvbSB2MSB0
byB2MgogICAgLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKICAgIC0gZml4IHR5cG8geWVpbGQgYW5k
IGZhbHVyZQoKIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMjAgKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwppbmRleCA4Y2Q3MDhjOTY1MDg1Li5hYmViZWY2NjZiMmJi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYworKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwpAQCAtMTAxMCw2ICsxMDEwLDkgQEAg
c3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFz
dGVyLAogCXUzMiByZWc7CiAJaW50IHJldDsKIAorCS8qIGNsZWFuIFNWQ19JM0NfTUlOVF9JQklX
T04gdzFjIGJpdHMgKi8KKwl3cml0ZWwoU1ZDX0kzQ19NSU5UX0lCSVdPTiwgbWFzdGVyLT5yZWdz
ICsgU1ZDX0kzQ19NU1RBVFVTKTsKKwogCXdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfU1RB
UlRfQUREUiB8CiAJICAgICAgIHhmZXJfdHlwZSB8CiAJICAgICAgIFNWQ19JM0NfTUNUUkxfSUJJ
UkVTUF9OQUNLIHwKQEAgLTEwMjgsNiArMTAzMSwyMyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFz
dGVyX3hmZXIoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCiAJCWdvdG8gZW1pdF9zdG9w
OwogCX0KIAorCS8qCisJICogQWNjb3JkaW5nIHRvIEkzQyBzcGVjIHZlciAxLjEuMSwgNS4xLjIu
Mi4zIENvbnNlcXVlbmNlIG9mIENvbnRyb2xsZXIgU3RhcnRpbmcgYSBGcmFtZQorCSAqIHdpdGgg
STNDIFRhcmdldCBBZGRyZXNzLgorCSAqCisJICogVGhlIEkzQyBDb250cm9sbGVyIG5vcm1hbGx5
IHNob3VsZCBzdGFydCBhIEZyYW1lLCB0aGUgQWRkcmVzcyBtYXkgYmUgYXJiaXRyYXRlZCwgYW5k
IHNvCisJICogdGhlIENvbnRyb2xsZXIgc2hhbGwgbW9uaXRvciB0byBzZWUgd2hldGhlciBhbiBJ
bi1CYW5kIEludGVycnVwdCByZXF1ZXN0LCBhIENvbnRyb2xsZXIKKwkgKiBSb2xlIFJlcXVlc3Qg
KGkuZS4sIFNlY29uZGFyeSBDb250cm9sbGVyIHJlcXVlc3RzIHRvIGJlY29tZSB0aGUgQWN0aXZl
IENvbnRyb2xsZXIpLCBvcgorCSAqIGEgSG90LUpvaW4gUmVxdWVzdCBoYXMgYmVlbiBtYWRlLgor
CSAqCisJICogSWYgbWlzc2VkIElCSVdPTiBjaGVjaywgdGhlIHdyb25nIGRhdGEgd2lsbCBiZSBy
ZXR1cm4uIFdoZW4gSUJJV09OIGhhcHBlbiwgcmV0dXJuIGZhaWx1cmUKKwkgKiBhbmQgeWllbGQg
dGhlIGFib3ZlIGV2ZW50cyBoYW5kbGVyLgorCSAqLworCWlmIChTVkNfSTNDX01TVEFUVVNfSUJJ
V09OKHJlZykpIHsKKwkJcmV0ID0gLUVOWElPOworCQlnb3RvIGVtaXRfc3RvcDsKKwl9CisKIAlp
ZiAocm53KQogCQlyZXQgPSBzdmNfaTNjX21hc3Rlcl9yZWFkKG1hc3RlciwgaW4sIHhmZXJfbGVu
KTsKIAllbHNlCi0tIAoyLjM0LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
