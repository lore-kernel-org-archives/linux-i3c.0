Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79755CD5BD0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xuDxk7RVfNEJkiCD/0I9zk8mi6fctXy/wTkuhA3Lf8=; b=t+3k6QWDOoPdxF
	LwGL/0/Qjen5ncwcdWkmwZvUf+WfRqofYd7RfVrtRnqa9Gon7jiIgvoAE893KtfpJ6ROhh0Mxx+/i
	1arWIp5L0QQbbAY9blN+CLGVkiMOHQEG7UCssxyk1AC91fRBgOAflGeQxVSCD02gh9GKZM76aXume
	nlhWpAHl6XIoM5WjmvS3AWhRsk7QaXjwjEfmMDa31lbYzS7sVWPBGbcJAlTzmblmvysqknBHYO5yY
	6dmf3negMcy0NonZaRRJS37QZzGmtrWmWnYU9B2VYd2hzPwLVj1nSTjTdIkj+N70nVnr3cj0LH2x1
	ufhciaz/8Gg7554EbM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUpo-0000000HG01-11pL;
	Mon, 25 May 2026 12:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUpn-0000000HFzE-1MeN
	for linux-i3c@bombadil.infradead.org;
	Mon, 25 May 2026 12:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Dobp+8XPRNGUvZqXv7EUCJ4nA2PN4VPudIxcDeZbQb4=; b=CM2sYPvpfqhOtgBXwrMH0UeS12
	XZpNH1Io21VG3j0uvE0uTcZwRoHhiQ8WOX+ZF5cfolOL/2Ne0+/CsTD3Uvvff3w5/gTfOV6dIG+7a
	lV1z9NFNqebciBl0XxHvjVk9tzTC9l3a4m6pKNNSXgUPU6prj0PYXPCM3+76QyHtw408ERpSQ2y4B
	JCzkGADllSUcbc8uK6KAo87jBi8LPCH4fR3d482AMGZartMoZkVQROBsCFEVU+jEacTqFX4xP9ObU
	zTa6YltVMSLtzXx7oRmymbuki9CtVf0/GLAUgjA3LynbnbFXdWPxxNM5AB44SbHeacy1S41BK4KvT
	M6a5+JJA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUpj-00000009EtH-16lm
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 12:55:05 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCsqeP71059474, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713693;
	bh=Dobp+8XPRNGUvZqXv7EUCJ4nA2PN4VPudIxcDeZbQb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=goLKnkLgJqbMTkBApizRUnmPxHU1FwJiLYOD0k/fkYrZEJor/knhkhv5vih+Wn7KY
	 vGW+JdpoO+SDOMAIFJAB5Rv9dL6AsnWjwYBeVi9pg6Eq1zY5x2XgCUNLABhza0H2tc
	 z30rGKxDQIBUXopjSOmz7V2+T2O6oQGcprjLZe1ZqqhmOAysuUy+uUatTH9TjT/PUM
	 KBHZBbtPmtHWSbGTHOkRY1NPSBFAJ/4Dr+EJoI46+EVKmxUPxrLSrksSiW6v6mcDvn
	 9wntm0/DsUUlwIjeVk4xyQQt6Olj2tfSnGMsk5lhBf/uWR0PIhVWhoABwsBemIlqHP
	 NzS7ermyr9Xtg==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCsqeP71059474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:54:53 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:54:52 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 20:54:52 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogaTNjOiBhZGQgYmluZGluZyBmb3IgUmVhbHRlayBSVFM0OTB4IEkzQyBIVUI=?=
Thread-Topic: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Thread-Index: AQHc2JrXcMCnLUwHnkiPRbUzP688hrX4ZM2AgCZ0w6A=
Date: Mon, 25 May 2026 12:54:52 +0000
Message-ID: <9ce3eeed6ec344b88cc7f488493a78ff@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <a75d18d5-1637-45ec-ba78-01867089a2af@kernel.org>
In-Reply-To: <a75d18d5-1637-45ec-ba78-01867089a2af@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_135503_927191_390E8F20 
X-CRM114-Status: UNSURE (   4.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBBbGwgaXNzdWVzIGhhdmUgYmVlbiBhZGRyZXNzZWQg
aW4gdjIuDQoNCkJlc3QgUmVnYXJkc++8jA0KWmFpbiBaaG91IOWRqOWvhQ0KUmVhbHNpbCBNaWNy
b2VsZWN0cm9uaWNzIENPLiBMVEQuDQpFLW1haWzinIkgOiB6YWluX3pob3VAcmVhbHNpbC5jb20u
Y24NCg0KDQoNCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
