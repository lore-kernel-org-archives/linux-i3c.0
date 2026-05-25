Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50A6CD5BB1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxra5rDUNxKsNTQ52E4vjnI186moYUWF8VMJ7ODXbJQ=; b=i+y9kC5M5ISMO2
	6P7irCcfT1xtUsC/X99RvJvaEGbaysQVjGGguE7MvLEYcat+KshSSFC1yoDVvyiwA5yZNwCT69/4N
	6WixzCRaVvuBOhDS35n+luLScBxld3Tnlvm7tlLCLEvHUyqicJTu5Wj5Z5vLaOYlwlfLm+Al1cBqe
	G9WFe3qC1ukoTbLfw+wn2SXesmH7JK78Ur2LoKai7/jmnlKLwluXK+DSLgkI19NthttBdNdxOEbWE
	bUx1hfgjLpjc7G8qvSN9+SlP4Hdqa+WLS6FH//ln+QUAScy64FpTxTQjffWnUpYpqMqqtwjwRYT7y
	W0g1fQ8OFGoKoNe21Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRV2G-0000000HH5L-1x46;
	Mon, 25 May 2026 13:08:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRV2F-0000000HH57-05GN
	for linux-i3c@bombadil.infradead.org;
	Mon, 25 May 2026 13:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RToh+6gSjpe+Jlt7aGEVqRli78mk+c1io2CsQwG8XyI=; b=YGh8Z6Nq/pM6TN4hUre8KOFV1V
	pxnz7rWO+9joYWZuhNL00E1gkAwEvQ46Eio1wJT0wKTG4syb59ztJckG2NfJcapG6wYvv0XeEHHVW
	9qvGatQ/xLGInNvmFeMhk9PDJ4o6y7AKqKP4PrRaiCvTJCmxanEGTv8RHqw7/PeNzvg3aYyJyVSn5
	aYOeX73/u7PYSkmB+wjo4xE3WydjBzO4sdgs5RunhJH9OTAOSZWnBnsXnSyC2Gs2Prp3rbQE6dkNB
	4arzTdtfAo9QfKD++eDiUcNBWEV8lKXkrPFRSzgam+hiUVxuwqS+jeyZpqxuGrZtMWV2xBe/sIOdV
	XaEN+k6Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRV2A-00000009G9p-4APd
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 13:07:58 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PD7dszE1063728, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779714460;
	bh=RToh+6gSjpe+Jlt7aGEVqRli78mk+c1io2CsQwG8XyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EBCtgRBvKk5TY2TjH8mGuly/JI6u4PJmCNjdRb5qkuvdxDeRinR2ufy22WNou16XM
	 B5Jup5NWd6k2Np9R42FgJ2EDOpk4XR3Psd0iEGCzmESEqTsOPg5oat1LRrNxwHAYkV
	 YaZvsbBinMfXvqgDeK+hoVgo8n9/nku3ns927nDxoTj7mOAvAIsv9fXbPcBl+7wVqr
	 YgQ4Mly0n+9nKm2Nko5LR0kWC3UkY7Jm7YeUYdvCmFUYuILaum6FlRSRFZ8hGsi4P8
	 yNtRZSEm2IDRIoOZCH7RERWtKugKu03QjEMy1RCusq4JqLDSc3q9odLcTiiIaiQ3tV
	 IyUsEOeCA2Nkw==
Received: from RS-EX-MBS4.realsil.com.cn ([172.29.17.104])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PD7dszE1063728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 21:07:40 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS4.realsil.com.cn (172.29.17.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 21:07:39 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 21:07:39 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Frank Li <Frank.li@nxp.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogaTNjOiBhZGQgYmluZGluZyBmb3IgUmVhbHRlayBSVFM0OTB4IEkzQyBIVUI=?=
Thread-Topic: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Thread-Index: AQHc2JrXcMCnLUwHnkiPRbUzP688hrX902GAgCEKCSA=
Date: Mon, 25 May 2026 13:07:39 +0000
Message-ID: <871742681d2047c794f0a46c03620dcb@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <afkCvVaPb-NrLs2P@lizhi-Precision-Tower-5810>
In-Reply-To: <afkCvVaPb-NrLs2P@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_140756_262035_C77376E2 
X-CRM114-Status: UNSURE (   5.28  )
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

SGkgRnJhbmssDQoNCiAgVGhhbmtzIGZvciB0aGUgdXBkYXRlIOKAlCBncmVhdCB0byBoZWFyIHRo
ZSBOWFAgaTNjIGh1YiBmcmFtZXdvcmsgaXMgbmVhcmx5IGRvbmUhDQoNCiAgV2UgcGxhbiB0byBy
ZWJhc2Ugb24gdGhlIGdlbmVyaWMgZnJhbWV3b3JrIG9uY2UgdGhlIFAzSDJ4NHggc2VyaWVzIGlz
IG1lcmdlZCwgYW5kIG1vdmUgdGhlIGRyaXZlciBvdXQgb2Ygc3RhZ2luZyBhdCB0aGF0IHBvaW50
Lg0KDQogIExvb2tpbmcgZm9yd2FyZCB0byBpdCBsYW5kaW5nIHVwc3RyZWFtLg0KDQpCZXN0IFJl
Z2FyZHPvvIwNClphaW4gWmhvdSDlkajlr4UNClJlYWxzaWwgTWljcm9lbGVjdHJvbmljcyBDTy4g
TFRELg0KRS1tYWls4pyJIDogemFpbl96aG91QHJlYWxzaWwuY29tLmNuDQotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
