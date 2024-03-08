Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA11C5475B
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Mar 2024 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsZ3c6OR53/LSoIe7ZztpEtH3D8Z1DD9o9b07y3d3dE=; b=VgRklgRVhGO+CI
	9H6APUkUhQ0UsMIcfR55NEG4304KJMXn9hHkKC2O8CVn9r6c5YNBPvPIbtBrWZRYNopV7BFOl4M+R
	kXAyIZvZUdW9w/605Jymb8y+fIEClA8+w1lOt9HjUmdFaIYzflr5H1KtPWS2YORcglcQF7Mz3rp/i
	W9LUcajckGU96QxFWki4JQ2/lfy5G94aat8iU5/I8cMhIyeFC13WOwSwur1CHyTD9vzeqohhtbe+l
	ETXoI2tyMrFB+aW6EXxv94yOUlF2lvZ+JZ3eNY928p2LqcGjLpY3EdXtRtZcoQx7XZtF/qEN0C3vL
	1746/CLYJOuE5oVbeXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rid33-0000000A9ws-1HXn;
	Fri, 08 Mar 2024 16:26:17 +0000
Received: from mail-vi1eur04on20600.outbound.protection.outlook.com ([2a01:111:f403:2611::600] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rid2z-0000000A9uQ-005x
	for linux-i3c@lists.infradead.org;
	Fri, 08 Mar 2024 16:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nF3pRpBispG98ZcR/36y/5U6Ac0/h6EWXFNt7Np1jtftArAlasMCzYqRhfl39hpnvK5N9/4ZWGfJpkpHpYyUMS4ihXm06djWbp1rPEZG3CFCJLJ4jtZrDUjR8UyqP4TcN2hDoZBorX9snD1iSp7IE+0WosXgNqwUyS74muwvMU1Q8jGvmnxHBfAxw9jfTn3KgKaf7LTp5448qq2XZi5HPWjim3HA4ponpvQ8j7oqJYFPFC3uVIM+bxGZKgxD0jAIgILDo+wOvP5JJk+8IZIQ/7cz9Y4fKJ1NLnVqndNXqoKAk67KaJrahmr70nuvK3fbB8DkA7QN80XZdcSHp1BMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=naW+6/QLvwX4dn6116XICSZRS8rfWN+GlI6qzjai6lvNRJPXU/yJb/kGmnk6A8CqHBxq6DpBKefSpl/OkD0betPWBEglTOkhOGg50W4fE9zuE3cpfK5K8KJ9RKDvf8oU/tp/ExzCvWHTdAo1yjegLO+S9KAMToQ3TriF7Ew9/3PLefJrXvc6y1zXv5QN6tZ4KZI8V33GL/hcE9A3VnubEsMWBIF+urMXC7+RJePHH3zX85JXk1iO7yoOaRRfMXBPRRHlvOeIpApjxd6EGIQaP78PLgOJoXl66QiHIMb5wSL4rTR14xtTTeoUONlNs3lHJBc4nPCSh4pFFthdXq0dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=c3Mdx6jtSTmjFNIiN7wGqE39VdNsRNU3kLrCvQN7cv/B32jISrNw67XSJoYy41UTdpzqcl7b4GOpsDRztlLPmUDGnd6RtVTF5x1m1zsfGEazi8OqRINQmTZn75HHNjFELOM4ZRMnxiA6awF8RO7MEvFWN1aHTCONwmaSsP6ipkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9864.eurprd04.prod.outlook.com (2603:10a6:102:390::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 16:26:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 16:25:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com,
	alexandre.belloni@bootlin.com
Cc: conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH v9 0/8] I3C target mode support
Date: Fri,  8 Mar 2024 11:25:10 -0500
Message-Id: <20240308162518.1615468-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7024ec46-c412-45e5-a4f7-08dc3f8c7069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5DVDi0+9NPQ3oOB3NwATvAVe/XPcemCLCgLMhCX49PMtX4/89enS4YEvhO6luyme1bIkuOQwUVuRr7eR8ul6aOlGT4hlACFsw9KSex0DvEITKcY6kBhY6hK+hjTRmv/hWF78+gupagv7IksKzFgaAOWm21lTrWjezcZekAX+BuJByRsao5C/Gy5ZHY7xP8y0NAbwSXr10ULj3N4SJGqjTWoJAiGDB2PJ6p7ebTQCWxlg3WxXy4/6UcGf/kmIskD7q2vP3tBGEoOxMM5fSgNz/mH18KWmn79MVf7dn0GfXmGKoT/0k/p+jUBlllCveReMr2qFLowMiCjt9J7BU0x9HYDrqj0k9jR3jWYgW6ooBPoh5qYMxMGzlFLhKCOOPBAuHobeYSK9DLqKMEmw3tAZbSD9WhOel+wZE8Cst/T133QWt01ydSUawd0ahTQndZX47xMenhBFMVpd4KRUbuBqF15/vT5ICDZgrvwRnGWUCnyPeNq1f2Jpdj3ngECXEFvq9Fd5GonKe5CeqgwzoHz++i3iAVKXQgoG3L2m3LT7+mBy4PEpM9HB8u+l+EIDAl5YKDVyzDCrAjZbU8js/tZPq4z9frMFVp0lUjm32IpnUUMTQNfabbOqAsHsub6BRvY1C+1kpoMruo8JjLRLQpOWLAcwp9MZXM8+NwVA3GgDdi1wAchSAQG8YWslE3XFpeS27drpxEciDbYj6E+PNGS9Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(7416005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0htcW9PdEhMMW0rY1lPbEN5ODBtV0dMSzdtY04rLzhDUmpIYk11N0JXaDJU?=
 =?utf-8?B?cmJJOUpzQzZPYmhHM0hvTnZKQjYwMUFva2p2OHZaa1RLcEZGa3B0TXQwM2Nn?=
 =?utf-8?B?clhQUi81eU5KeFRkZEMwZjJ3S3Z3Ujh3TS9oU28zYjlKdXlYMHlISW1qRjVy?=
 =?utf-8?B?MWowV2oreEMxeWlSc2JYcDlIdm1saUg3NitPOVRVdWpSOUo2QzgxNVNtZXZm?=
 =?utf-8?B?UWdNZ3VwSGRDdmU1TW94bjJidGNiSFcxMkZwd2tQSGMzZjJjc1dkL1cxeFFM?=
 =?utf-8?B?VmROUHAwaTdQOGxQY3lFRExXeU1zQkFiRnBkZjkrb2oyNUhiSnZDclJEWnlF?=
 =?utf-8?B?S0lIcm05a1FlUThlU3IrZnVqbU5IOVRCVU5lbkZoK1ZZMWZrTUVZRWVtK2dF?=
 =?utf-8?B?ZG1pejdXVUdHM3pFVDZ6bkhHaEZvM1cxWEdZcFU5cERQNnY2ZVBtUUpCQlZZ?=
 =?utf-8?B?MUlsM1ZGSG5oS21FZEIyUmNQUStnQkJXM1pDbCttTnIyZCsrb2szaHYyVlJG?=
 =?utf-8?B?OHN4Ykw0Vy9vbnVwTlBQcXhHNTlaWldSMGNiWUMrd1lldnhzOXUyK0pkdWw0?=
 =?utf-8?B?cXVYeDdKNGxDQjZDVUhvNTQ5UmlsTkU4Y0c1eTJWUVZURWZyU2NwdnFRN1JJ?=
 =?utf-8?B?a0pDM09KdFhLOWpzTU1UQWtWTklDY0VuaHB5YkNmZlBqSXhmYW1lUmJTYkhm?=
 =?utf-8?B?YWNNUWp5Nlh6OHVaT21lZVBoSWV1K2M1Q3BMZEZNS25zOTEySkFJZ1lZcjBG?=
 =?utf-8?B?eXBYQjhjZGZjaFQ2ek9ScUFSOThESFlLbGlSeDZxWWhjVlNNQmhwUjRPQzlz?=
 =?utf-8?B?NXlLQm5mRnlLMjNxNGJ6TE9NWDVGNnNOMEcyN0MvRWVSZWJ6am1mYkNuRjI5?=
 =?utf-8?B?ZmtES0JkdUJKTXdMcHpLbHFJcVdpdzBmZitvaGVNV3RFYzUxL0ZVS2xkMVcy?=
 =?utf-8?B?WS8zQUsycWpSSXJES3dWWWFxTFFXTGpCZWVSNll0MlIzeHgzUDdXQUt1c1Y4?=
 =?utf-8?B?Ym9lNDFDeC82SWZ0NW14QTZQSmg2R3ZSemlDbVZqSm9QbGJFdWc5blMwNzdO?=
 =?utf-8?B?STVpODUvZVZzTW16cXVXV0lrTVJ3RlJFK2lHZnZFS1FTbHZiOEEwSldhQUta?=
 =?utf-8?B?VmsrdHlVdUZ5U2hyTllDQkk0eGpwOUI4SGR6Q0k0eTU5Wk8vdFN6Y2dXL3V0?=
 =?utf-8?B?eTlvMTlFN3JRL1J6VUhVWlVFZHY4Ti9KQVdIZGh1VXhJeWtObTg2SnZKT1pW?=
 =?utf-8?B?VmwveDhVa1BqVFcwTUdDSjNZWEwvRXFnT1F4Wk5jU1hOSkVZbjRpOUpVcVRH?=
 =?utf-8?B?dGt2MUNsYUNYZVhrdk1ZYStVQjVCZnJYK0pSTzBsYkVYZ1IyTFJFL1dkZU9P?=
 =?utf-8?B?Ty9zQ1ZhTmRzcGVHeFZ3Z3hsbk5IR202Q1Fyemhrd21MVklVd2FXMXBRRVhH?=
 =?utf-8?B?bTI0RTlpVFVVK0t3ZCtZcFh4MWN1K3JDcjlQQ1NUbFI5Lzg2dVIwTTNXY0Mv?=
 =?utf-8?B?ZktQaE9sMVdIejJWQjI1OVBsOVV0TnlZWk9JNXp3OE1Sdmpvc2dGMFovRHc4?=
 =?utf-8?B?REF1UzlFcUlENlFaWGJuOVp3QWM1dGdXM1NCZVYwZnlpcktlMjg2VS9qUmdW?=
 =?utf-8?B?TjdwUEhWRU9YcEdZVkdaNDdDdXJMZDZCYnI4Wi9WbUJZVzV3Q0Iyb21iZzJv?=
 =?utf-8?B?Y1YrSXp3UkZ4QkVMOGMwNVZtenBPNm5NaEVQYWxuM1VqZUwveldDcG9MV1ow?=
 =?utf-8?B?WmxsZVlmelRkMU15TWdTeERiaFIydDM1blBmYTNCR2QyeVBWaDJ5TmtwVS9y?=
 =?utf-8?B?ZDliNGRiZDlBalhiVzFhSDRjZkhhTktNdTlPd2FWQzlDQldlVDJhUGY4N2kz?=
 =?utf-8?B?MWJUWHJyZkFYTEU2YUlOZWdSZVZBSzY1T3lNSUFxb2ZzZVZZTHdGSmYzeFA5?=
 =?utf-8?B?YUJpMDFDUnNxdkNnbGJMK0NjSS80VTVGdEw3VnpOaWxoblk4c1hwaDNCdzBT?=
 =?utf-8?B?QkEvYzdZblRRWFRRWFJoenZpYUR0NFlQZnFzNElxRHZHNnUra2hGZzI3dGxN?=
 =?utf-8?B?Q0ZqSU5HSno5OFRwVHVpRFZMc0lRWUk0QjNLYkwwTHcwRU44clVjRDhGR2Mr?=
 =?utf-8?Q?e5dtZ+aEPXnFmiv+AVH8hBExJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7024ec46-c412-45e5-a4f7-08dc3f8c7069
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 16:25:59.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snuvm03YAwe29IvpAVkwx8UTdPwDVdPkOjoNx3GmiEzVvxLg6BAMjGAgYMngs3HQLEaGpP0wqYSY+bL594OseQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_082613_175904_11A4CA58 
X-CRM114-Status: GOOD (  16.47  )
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

VGhpcyAgcGF0Y2ggaW50cm9kdWNlcyBzdXBwb3J0IGZvciBJM0MgdGFyZ2V0IG1vZGUsIHdoaWNo
IGlzIHJlZmVyZW5jZWQKd2l0aCBhIFBDSWUgRW5kcG9pbnQgc3lzdGVtLiBJdCBhbHNvIGVzdGFi
bGlzaGVzIGEgY29uZmlndXJhdGlvbiBmcmFtZXdvcmsKKGNvbmZpZ2ZzKSBmb3IgdGhlIEkzQyB0
YXJnZXQgY29udHJvbGxlciBkcml2ZXIgYW5kIHRoZSBJM0MgdGFyZ2V0IGZ1bmN0aW9uCmRyaXZl
cgoKVHlwaWMgdXNhZ2UgYXMKClRoZSB1c2VyIGNhbiBjb25maWd1cmUgdGhlIGkzYy10YXJnZXQt
dHR5IGRldmljZSB1c2luZyBjb25maWdmcyBlbnRyeS4gSW4Kb3JkZXIgdG8gY2hhbmdlIHRoZSB2
ZW5kb3JpZCwgdGhlIGZvbGxvd2luZyBjb21tYW5kcyBjYW4gYmUgdXNlZAoKICAgICAgICAjIGVj
aG8gMHgwMTFiID4gZnVuY3Rpb25zL3R0eS9mdW5jMS92ZW5kb3JfaWQKICAgICAgICAjIGVjaG8g
MHgxMDAwID4gZnVuY3Rpb25zL3R0eS9mdW5jMS9wYXJ0X2lkCiAgICAgICAgIyBlY2hvIDB4NiA+
IGZ1bmN0aW9ucy90dHkvdC9iY3IKCkJpbmRpbmcgaTNjLXRhcmdldC10dHkgRGV2aWNlIHRvIHRh
cmdldCBDb250cm9sbGVyCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKSW4gb3JkZXIgZm9yIHRoZSB0YXJnZXQgZnVuY3Rpb24gZGV2aWNlIHRvIGJlIHVz
ZWZ1bCwgaXQgaGFzIHRvIGJlIGJvdW5kIHRvCmEgSTNDIHRhcmdldCBjb250cm9sbGVyIGRyaXZl
ci4gVXNlIHRoZSBjb25maWdmcyB0byBiaW5kIHRoZSBmdW5jdGlvbgpkZXZpY2UgdG8gb25lIG9m
IHRoZSBjb250cm9sbGVyIGRyaXZlciBwcmVzZW50IGluIHRoZSBzeXN0ZW06OgoKICAgICAgICAj
IGxuIC1zIGZ1bmN0aW9ucy9wY2lfZXBmX3Rlc3QvZnVuYzEgY29udHJvbGxlcnMvNDQzMzAwMDAu
aTNjLXRhcmdldC8KCkhvc3Qgc2lkZToKICAgICAgICBjYXQgL2Rldi90dHlJM0MwClRhcmV0IHNp
ZGU6CiAgICAgICAgZWNobyBhYmMgPi9kZXYvdHR5STNDMAoKTm90ZXMgYWJvdXQgaGVhZGVyIGZp
bGVzLgoKQWJvdXQgSWxwbyBKw6RydmluZW4ncyBoZWFkZXIgZmlsZSBjb21tZW50cywgaXQgY2Fu
IHBhc3MgYnVpbGQsIHNvbWUgaGVhZGVyCnNob3VsZCBiZSBpbmNsdWRlZCBieSBvdGhlciBoZWFk
ZXIgZmlsZXMuCgpJIGFkZGVkIHNvbWUsIGJ1dCBJIGFtIG5vdCBzdXJlIHRoYXQgaXMgYWxsIG5l
ZWRzLiBUaGVyZSBtYXkgaGF2ZSB0b29scywKd2hpY2ggY2FuIGhlbHAgY2hlY2ssIGJ1dCBJIGRv
bid0IGtub3cuCgpDaGFnbmUgZnJvbSB2MiB0byB2MwotIHVzaW5nICdtb2RlJyBkaXN0aW5naXVz
aCBtYXN0ZXIgYW5kIHRhcmdldC4KLSBtb3ZlIHN2Yy1pM2MtdGFyZ2V0LmMgdG8gdW5kZXIgbWFz
dGVyLAotIGJ1aWx0IHRvZ2V0aGVyIHdpdGggc3ZjLWkzYy1tYXN0ZXIuYwoKQ2hhbmdlIGZyb20g
djEgdG8gdjIKLSBjaGFuZ2UgInNsYXZlIiB0byAidGFyZ2V0IgotIGluY2x1ZGUgbWFzdGVyIHNp
ZGUgdHR5IHBhdGNoCi0gZml4ZWQgZHRiY2hlY2sgcHJvYmxlbQotIGZpeGVkIGtlcm5lLWRvYyBj
aGVjayB3YXJuaW5nCgpTb21lIHJldmlldyBjb21tZW50IG1heSBiZSBsb3N0IHNpbmNlIGl0IGlz
IHF1aXRlIGxvbmcgdGltZSBzaW5jZSB2MS4gTm93Cm1hc3RlciBzaWRlIGRlcGVuZGVudCBwYXRj
aGVzIGFscmVhZHkgaW4gbGludXgtbmV4dC4gU28gc2VudCB0YXJnZXQgc2lkZQpwYXRjaGVzIHdp
dGggdHR5IHN1cHBvcnQgYWdhaW4uCgpObyBzdXJlIHdoeSBhbiBhZGRpdGlvbmFsICJcclxuIiBh
cHBlbmRlZC4KCkZyYW5rIExpICg4KToKICBpM2M6IGFkZCB0YXJnZXQgbW9kZSBzdXBwb3J0CiAg
ZHQtYmluZGluZ3M6IGkzYzogc3ZjOiBhZGQgcHJvcHRlcnkgbW9kZQogIERvY3VtZW50YXRpb246
IGkzYzogQWRkIEkzQyB0YXJnZXQgbW9kZSBjb250cm9sbGVyIGFuZCBmdW5jdGlvbgogIGkzYzog
c3ZjOiBBZGQgc3ZjLWkzYy1tYWluLmMgYW5kIHN2Yy1pM2MuaAogIGkzYzogdGFyZ2V0OiBhZGQg
c3ZjIHRhcmdldCBjb250cm9sbGVyIHN1cHBvcnQKICBpM2M6IHRhcmdldDogZnVuYzogYWRkIHR0
eSBkcml2ZXIKICBpM2M6IGFkZCBBUEkgaTNjX2Rldl9nZXR0c3RhdHVzX2Zvcm1hdDEoKSB0byBn
ZXQgdGFyZ2V0IGRldmljZSBzdGF0dXMKICB0dHk6IGkzYzogYWRkIFRUWSBvdmVyIEkzQyBtYXN0
ZXIgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFzdGVyLnlhbWwgICAg
ICB8ICAxMSArLQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy9pbmRleC5yc3QgICAgICAg
IHwgICAxICsKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC1jZnMucnN0ICB8
IDEwOSArKysKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC5yc3QgICAgICB8
IDE4OSArKysrKwogLi4uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdHR5LWhvd3RvLnJzdCAg
IHwgMTA5ICsrKwogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0
IHwgIDEzICsKIGRyaXZlcnMvaTNjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAzMSArLQogZHJpdmVycy9pM2MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIGRyaXZlcnMvaTNjL2RldmljZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
NCArCiBkcml2ZXJzL2kzYy9mdW5jL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkg
KwogZHJpdmVycy9pM2MvZnVuYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAzICsK
IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQ4MSArKysr
KysrKysrKwogZHJpdmVycy9pM2MvaTNjLWNmcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
Mzg5ICsrKysrKysrKwogZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNiArCiBkcml2ZXJzL2kzYy9tYXN0ZXIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1haW4uYyAgICAgICAgICAgICB8
ICA4MCArKwogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgICAgICAgICAgIHwg
IDM0ICstCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYyAgICAgICAgICAgfCA3
NzYgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy5oICAgICAg
ICAgICAgICAgICAgfCAgMTUgKwogZHJpdmVycy9pM2MvdGFyZ2V0LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDUzICsrKysrKysrKysKIGRyaXZlcnMvdHR5L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMyArCiBkcml2ZXJzL3R0eS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy90dHkvaTNjX3R0eS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNDMyICsrKysrKysrKysKIGluY2x1ZGUvbGludXgvaTNjL2RldmljZS5o
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L2kzYy90YXJnZXQuaCAg
ICAgICAgICAgICAgICAgICAgfCA1NDggKysrKysrKysrKysrKwogMjYgZmlsZXMgY2hhbmdlZCwg
MzcyNCBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdGFyZ2V0LWNmcy5yc3QKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2Mt
dGFyZ2V0LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9p
M2MvdGFyZ2V0L2kzYy10dHktaG93dG8ucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pM2MvZnVuYy9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pM2Mv
ZnVuYy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2kzYy9pM2MtY2ZzLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYWluLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2kzYy90YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdHR5L2kzY190dHkuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvaTNjL3RhcmdldC5oCgotLSAKMi4zNC4x
CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
