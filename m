Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CF5CDB465
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Oct 2023 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42riBebKxRVR+UsWusRfXukAQQHd1x8oWIpTMwa217k=; b=iHQsAaTXoD7plM
	fRaZ/AUtTFbe/nRHmdBMwehqC1cHGnQPQd4/yW4N0cy7bnZpTmn6NslDKfUj8VHdmzhv/2WTZDIiq
	K8YuCGzfo+5Smdt+EyqltXqwNskGKpiPJLXxBZY2YeXuyvx4Qx1+FRgWrn8df9Ihuvi9fB6888Op8
	FTw8ukxxOSqnKMhcxceJpR0LiQ0ebrIbWbkyGsDsgOrokfqTCBnfKQSELwrvw7vjKy89r7POEeb3X
	CTNhXmDF+MC5dhUS15zqmZ/8WaKv+5XfLwBpfQ6vOBXlijgejMYruunJ5MXoIq2FDCuy2w+8Riv10
	RtQ94jp/sHRHewlor3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPaW-009zPU-1V;
	Mon, 16 Oct 2023 15:33:00 +0000
Received: from mail-he1eur04on061e.outbound.protection.outlook.com ([2a01:111:f400:fe0d::61e] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPaS-009zKr-0o
	for linux-i3c@lists.infradead.org;
	Mon, 16 Oct 2023 15:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVkXKgA1+LpgBKJxpjyFd/bVugKjzVctsj3qK7B2kqE4GbY3rHdSw36nQYzu2+0wwbW6pMcnpcQF/Hgwc8Un++7SDSlUeak2hy7jcFmbZi3GofDeWdiebOWXkUJT2/UqFIG4Np+YIURQB3qjwvimmEG8G/Ny2BeFndW3/rVc4Dxt4iq9jh/vQycd2GLuv0nJ0z1hmKECymLEahE8Pw96R7Sc5MkVfjCaFjn9tp2tpvn+qYmGwh8GZNiq8aIvWt6tCa1GdeDEumS0O6PE13hAqEPP9//4E5tPf/+3eoCmoTmSqi07h9DggO9e/37epF30/n8Y9+vQhGcZDXnkk+uiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvIe54O5QCnNX7y3AwVwXO/OJ5Uma3/csUrgUguDejw=;
 b=IUS65wvn5eLDwJZ3br1/UW3zgvgVXBI39tw9TNPtFs8K4adLicWHfC6JKVWaL05opnW3DzbduKiAvq8Mobh62uuAH7Lw4fvmj5M8svEtz9gEVZAFmoSImClng2ePpe7rnhwe2awpGR3QY5pTdMgVYrJRTZf6EIUuYGIQQ2AkPvxZCINlgpAu5lers+jNSH4xFCTJou820pa4Q5lxvI9kmlu5up4uMgoJU4e6YIWlU3pMcqUjQEGHO4LmmiM/EhuDZd7KPkclZn/SgBTPx9SRz/8AAqUf55zswI3hEEy1OPwXqYUuZxMBYAvcwPLJfZNZi7K4roHXIO4nzpL0Ykv3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvIe54O5QCnNX7y3AwVwXO/OJ5Uma3/csUrgUguDejw=;
 b=AKApbANDLCdTH72KxQAaf5/ykh5DjBg8ZE7TyhA0Bc3H/h4ey0T9ytt0F6XAgs3S0MxxNU4MMzcrSymTtYWwyHOavV5AdWU5kjwz6okdB6XaytQCKUf1QNlFyhDC5NYTU70FPEcXkdWNtgBsdlM/cY8A4vTB9Fk6zNgUyCjymV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB7592.eurprd04.prod.outlook.com (2603:10a6:20b:23f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:32:50 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:32:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
Date: Mon, 16 Oct 2023 11:32:28 -0400
Message-Id: <20231016153232.2851095-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016153232.2851095-1-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bba315f-0fe9-4cbd-5aa3-08dbce5d280b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfD4F+UQUfCfQWT1KV3mgpduE+31+aM+gYyYgpwFlKHkL8HVnQM5XSoQuFmO8grJdRmXUFsagROQrIFyxuM5axm0Q4wDWSavbp9T47D+kNR37FzpLk15zcNt/119gM3qeCYExJb0K+GF/K5tdFp29J5FiXWjzUNuVM/UD5pEJXsVdZLW+iyL5RZeStx4uffpcjPljohq8tp1pg6xLWM3ytd0jNuxpWpSmkHf6rjU9T/3ri2Yyx658YCZL+MIbuHPB0CWIwO8zihdnDzugE8JgZ7ZJctZPCdrKI4Au3UcYa2gXPXjqB870l91KQkhE8HIN3cWZN3Uy/c4wZK+yQHnXoTGeEHIp8Pu1xuWojyE1y/MdtSKEffn8KGpYB+LuRmEmLVisWMDY4MDsWR1EsnuzZERCPsO7CiXsEXXxQdOWRVa/MNrhkLlsuGtLjnaDNIY0/qJxVAxoRffRw34l7Uhnx4f3HwNUvkLS/JH9c0A9kfpjsBATy1/rRJebp2IoU5zadqn51WuTXCdQg/NVPUopnipD475qbbrig8XsB1sJ19RFVEin9HVPCRa3QFxCKYlbZ4DWOEi+RD5GF1ksE73DeDtm0CEQ+TYobSQGxAKy39iww53Lg3qFKF/dKeSt8+r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(38350700005)(36756003)(38100700002)(83380400001)(6666004)(6512007)(26005)(6506007)(316002)(66946007)(66556008)(66476007)(478600001)(1076003)(2616005)(52116002)(2906002)(41300700001)(86362001)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlrK1lobmJScVpmSE9UR3Nuajl3VlM5NGVac3haYUQzbVBLV2dxNlhjTlFJ?=
 =?utf-8?B?Tm92U2dIV2JrUkNEdmVaUEJQS1YxeVhLTXVRTkQ0UnpXeXM1KzNsSGFzL212?=
 =?utf-8?B?cXRUQkpyMnEwcGlIaGNlYVNJa2YrYlNTTjQ1eHhzVWFxc0JDdVdYUjQ4eFZw?=
 =?utf-8?B?TjlFQzVBOSt1OW9Nc2cvbUVnWlB4aER0enhRQ1o0T09jV2ljZTJkUm80eWlP?=
 =?utf-8?B?TnpCQlVPRUxPdEsvQjl0ZWFsTmI0bGpqNDVHcVRzTThYWW9QZkF6LzVPTmpj?=
 =?utf-8?B?dWRCdkpPMzNhSkhGVld5VmRTM056N0tscWUzSHBJVnFMZFdRWlhUWXRQc1dl?=
 =?utf-8?B?SFhzcG5rTmM5K0JSWWU1VTZDYmx5M1Nac0I5bVQwT0Q4RGRkTUZFQWxPQVZu?=
 =?utf-8?B?L3d3Z1RXeUJFWXArZ1FxWFJiMWhVQTZYdG1ndzZYeUtwelJldVRrV1Q0bTlR?=
 =?utf-8?B?cktlSlVyVVN0QVZSV1QxazRINUwramhLWUgwRk9va1dSb0J4Zm9HQVdLRjZL?=
 =?utf-8?B?dVNiR1l6WDhHcEpXSjNQRnRiZ0FSZGk5SHFIckN2ZzV0TENvWWd3d0ZyZGRm?=
 =?utf-8?B?Tlg0TWFuSjFkMG9ISEtUSDBDRlcyb0FJYUE5a01nUkJJcDV1amwzV1JsdXlD?=
 =?utf-8?B?aUJvbFhIQnJNaDlDSXpJTE5RL3Z3ZXhRK3pQdDd0ZXFwZnEwcElDS3NFOUlt?=
 =?utf-8?B?czBtQXl1SDI1MnNlUFJTSXRoOENSbEliYnNSaldWQ1JHOTJHaG1yT0diUTV1?=
 =?utf-8?B?cFdmckVBU1VFTU1RYU9pUVVqZEd2cWI0a1JRYzliK21xQ1pSZk0yVDlNTkhX?=
 =?utf-8?B?REQvSnlqMUx4eWdsZnJ3U0J2Yi9CR3VRbmdBbUVoOEZ3RDFtcTRYSlZOOEVY?=
 =?utf-8?B?VEdDMld3bmpvRmttZjVqYk1MN0FYOGtnc3ZvbU5iMTN0NURqUUh0TGt6OG1j?=
 =?utf-8?B?clJocnFIQzVQbHNsMzRhUVVwZ1JLemdEbkJ4Sm51VlZ4cVFJRWd2VDE1MjZn?=
 =?utf-8?B?a1c3dzlEMm96M0tLNlhQVTBwa0RSZFBlMCtEM3h4UDhxYmNtamN1b2xaUVZS?=
 =?utf-8?B?WlV2eDMwWU9GL0JkWTJWSGd2b1ZLUWJhUUU5Z2QvNXRWUHVIVWJ1SFB6R0Z0?=
 =?utf-8?B?NTJ4b0Y5d2c2SlVWWG52UHFYdWxDYU1DQjU4UnZudGdLWkdyR1B3ekZaVXE0?=
 =?utf-8?B?UmhJamlBMTNUMzRGY1NvdWxjTUhiM3M5QVB2SWN0d0ZtbHZoZFBVcVhJU0Np?=
 =?utf-8?B?SkJNTEYyVjNEOGk5Y1VMbkdpbmY2dnJ4RmU4STRCY3dNelVlWjRiYUhwOVZ0?=
 =?utf-8?B?VThJdmhCVlNGWGlMZllJV25DN1BRNWhMM3p1STBCNVNwSitabjR2MmRzd2JC?=
 =?utf-8?B?amVMTkQ0WnoxWEJRTndBRk8wRVNyNm4vOERsUHZIUC9HS0V6TTFHQUtZQ1I1?=
 =?utf-8?B?ZnY3dXJFNEd2ZjNtZVV2SVZRUlhMbFRqclc3UktRQ0UwSlZRMk1FZEJjditQ?=
 =?utf-8?B?T1h2OXBaaU96QTVKeThCSVQ3dllHa2FPRDRmRGF3ZUJuYUtoaXVoTWRIaGFL?=
 =?utf-8?B?UEhra05QdXgycDNkNkFGTkZRa211cWlDYXE1ZWQ4OElpZjlLTlAzbFBKUC9a?=
 =?utf-8?B?UlloOWZ0cElEK0RPV1haeVNlN1djT3RRU083ZEVCQ25JS3NNSEVNbUdqdXpp?=
 =?utf-8?B?aVpid0dRRW1JYnhqZ0NwaEhzeUZ3VmF3YjhNZG5WL2pyelZlY0x2eUk0WG9O?=
 =?utf-8?B?eVRIQk9pZXJvWmJ4VjQzNFA1UDFyaG1IQjJLNVd2aGI4VWVuNUVrTUZyUDBW?=
 =?utf-8?B?MVpWM3NOM3M1aGhxRDBFY1Exb21lcWlqMDkzc3FDYTIxbGtBb1JVRmp1Unc4?=
 =?utf-8?B?b3E0Y3ZmQ2ZTdSs3Zkc4bFVGZHdpY2VSWnVEL3VSZ1pJazdSeTBkSTZncHpn?=
 =?utf-8?B?cGMzMXpCQS9SZlREZG5tRlMzV1k0NnRqNVBEeVdOMTBqMTFnNnlpb3RLY3U1?=
 =?utf-8?B?VUg2bnF5TXBGMnExLzZvdXRpSHNSaXYrS3hKYzEwdzJOZWJEalNYbzNMOURs?=
 =?utf-8?B?SFYrY1BJSStNOTMvdjdOVTlvbzhVcVJDSXBzNHFJMmR3T3pjZDZ3THB6dXdz?=
 =?utf-8?Q?0oA0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bba315f-0fe9-4cbd-5aa3-08dbce5d280b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:32:50.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULMIngN0t84bbebWLfXv0QzBaEJuC2xkOy/Txofu01yrltD6TSf0nnYFIieoQ4adtEcl4ZDDYKYqrBOTa3IrOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_083256_294426_3B8CB8EC 
X-CRM114-Status: GOOD (  11.41  )
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
bi1CYW5kIEludGVycnVwdCAoSUJJKSBvY2N1cnJlZCBhbmQgSUJJIHdvcmsgdGhyZWFkIG1heSBu
b3QgdG8gYmUKc2NoZWR1bGVkLiBXaGVuIHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZlcnMoKSBpbml0
aWF0ZXMgdGhlIEkzQyB0cmFuc2ZlcgpmcmFtZSBhbmQgYXR0ZW1wdHMgdG8gc2VuZCBhZGRyZXNz
IDB4N2UsIHRoZSB0YXJnZXQgaW50ZXJwcmV0cyBpdCBhcyBhbgpJQkkgaGFuZGxlciBhbmQgcmV0
dXJucyB0aGUgdGFyZ2V0IGFkZHJlc3MgMHgwYS4KCkhvd2V2ZXIsIHN2Y19pM2NfbWFzdGVyX3By
aXZfeGZlcnMoKSBkb2VzIG5vdCBoYW5kbGUgdGhpcyBjYXNlIGFuZCBwcm9jZWVkcwp3aXRoIG90
aGVyIHRyYW5zZmVycywgcmVzdWx0aW5nIGluIGluY29ycmVjdCBkYXRhIGJlaW5nIHJldHVybmVk
LgoKSUJJV09OIGNoZWNrIGhhcyBiZWVuIGFkZGVkIGluIHN2Y19pM2NfbWFzdGVyX3hmZXIoKS4g
SW4gY2FzZSB0aGlzCnNpdHVhdGlvbiBvY2N1cnMsIGEgZmFpbHVyZSBpcyBub3cgcmV0dXJuZWQg
dG8gdGhlIGRyaXZlci4KCkZpeGVzOiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBB
ZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
ClNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgotLS0KIGRyaXZlcnMv
aTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwppbmRleCBlYmRiM2VhMWFmOWQuLjBmNTdhNWY3NWUzOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMKQEAgLTEwMDksNiArMTAwOSw5IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19t
YXN0ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKIAl1MzIgcmVnOwogCWlu
dCByZXQ7CiAKKwkvKiBjbGVhbiBTVkNfSTNDX01JTlRfSUJJV09OIHcxYyBiaXRzICovCisJd3Jp
dGVsKFNWQ19JM0NfTUlOVF9JQklXT04sIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7
CisKIAl3cml0ZWwoU1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX1NUQVJUX0FERFIgfAogCSAgICAgICB4
ZmVyX3R5cGUgfAogCSAgICAgICBTVkNfSTNDX01DVFJMX0lCSVJFU1BfTkFDSyB8CkBAIC0xMDI3
LDYgKzEwMzAsMjMgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNf
aTNjX21hc3RlciAqbWFzdGVyLAogCQlnb3RvIGVtaXRfc3RvcDsKIAl9CiAKKwkvKgorCSAqIEFj
Y29yZGluZyB0byBJM0Mgc3BlYyB2ZXIgMS4xLjEsIDUuMS4yLjIuMyBDb25zZXF1ZW5jZSBvZiBD
b250cm9sbGVyIFN0YXJ0aW5nIGEgRnJhbWUKKwkgKiB3aXRoIEkzQyBUYXJnZXQgQWRkcmVzcy4K
KwkgKgorCSAqIFRoZSBJM0MgQ29udHJvbGxlciBub3JtYWxseSBzaG91bGQgc3RhcnQgYSBGcmFt
ZSwgdGhlIEFkZHJlc3MgbWF5IGJlIGFyYml0cmF0ZWQsIGFuZCBzbworCSAqIHRoZSBDb250cm9s
bGVyIHNoYWxsIG1vbml0b3IgdG8gc2VlIHdoZXRoZXIgYW4gSW4tQmFuZCBJbnRlcnJ1cHQgcmVx
dWVzdCwgYSBDb250cm9sbGVyCisJICogUm9sZSBSZXF1ZXN0IChpLmUuLCBTZWNvbmRhcnkgQ29u
dHJvbGxlciByZXF1ZXN0cyB0byBiZWNvbWUgdGhlIEFjdGl2ZSBDb250cm9sbGVyKSwgb3IKKwkg
KiBhIEhvdC1Kb2luIFJlcXVlc3QgaGFzIGJlZW4gbWFkZS4KKwkgKgorCSAqIElmIG1pc3NlZCBJ
QklXT04gY2hlY2ssIHRoZSB3cm9uZyBkYXRhIHdpbGwgYmUgcmV0dXJuLiBXaGVuIElCSVdPTiBo
YXBwZW4sIHJldHVybiBmYWx1cmUKKwkgKiBhbmQgeWVpbGQgdGhlIGFib3ZlIGV2ZW50cyBoYW5k
bGVyLgorCSAqLworCWlmIChTVkNfSTNDX01TVEFUVVNfSUJJV09OKHJlZykpIHsKKwkJcmV0ID0g
LUVOWElPOworCQlnb3RvIGVtaXRfc3RvcDsKKwl9CisKIAlpZiAocm53KQogCQlyZXQgPSBzdmNf
aTNjX21hc3Rlcl9yZWFkKG1hc3RlciwgaW4sIHhmZXJfbGVuKTsKIAllbHNlCi0tIAoyLjM0LjEK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
