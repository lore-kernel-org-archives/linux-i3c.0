Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF3DCD5BD0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4QVujlH9R19rCRI7h08uRSF2cwK3SL6lrRxZVW1uho=; b=DcODejDT1t+PuV
	ZGZ11sSVk2Q5+6+cuMWoPLg2eDqXaJjmIaaXoLTPHHdQIq6aufZVsn8ci/SmlV1MhOa02ZoRLBMal
	z0y76pbpz92S/gIFkRTuE7gS5hdTMPPsEz8qhXiJnMtAJ+aadwCBzsNvQHhqIlwquVGnYQoBhyJoH
	oHDe/IDV8FqP6LqiVhljctHEx50IGPMN+C0k5PC93p8QnwPRuys13VSu0ZY0/WCZWXj6qDa/q7Uy6
	pDSQN9gWFEcE4SgFLLV0xeonv0V1q8NeRhWzn73i/uRZh8l4CMwEmqUK0oy5os9Weko4k/x8ryM/p
	gru8/Oa+RVkxUJZ1Jkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUtO-0000000HGOD-2tK0;
	Mon, 25 May 2026 12:58:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUtN-0000000HGNu-49rI
	for linux-i3c@bombadil.infradead.org;
	Mon, 25 May 2026 12:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QqDPJG6+HCasqnKgequ5m0+RP/Q+QlX9y4hLkzYWFOk=; b=LBl7pksSQVtjb3nJV5iuvpbLP3
	uW1HNZl95qPF80T2UVTyuPdlZkWPkKti4//A35mT/VKZmnJ5ymurdvUm79eo8ux/j6wB0nJmUZ0AM
	xAbGKUxdix7wqbmcuzl1IPjHf7FyE+ISa1h4VS211LqePMhRmuzPOvU4AVYhJlnKesGZzZmct0P8a
	jCvReYME5r7kG8Z/emaELPpOdXaBJlNkrKc5kaXIwkY9p0rY25iKZZrvokmdPzRFBwZEeHDigpNzL
	Flj6nJdCU2pbfYP9yAH9hzNT7dNivOGciGTTs/4O6qPHMdermlznpDy7f5YRSm+4ys0FMeo240Y86
	jWpZe0DA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUtK-00000009FKs-3nsS
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 12:58:49 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCwXwrD1060387, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713914;
	bh=QqDPJG6+HCasqnKgequ5m0+RP/Q+QlX9y4hLkzYWFOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Pi4fVRx9c+osONZzIgXdLvEZkDTLEP8laVjcov9t0fiA8MrL0K5/xK+otUD7PvGo+
	 rC2k3sPhZGK06oRpcGFq4VX03X/YJJsLbeixbF/rimemWTDiYCtrNRhMDLPWtSBeBj
	 dxTniR+xT7i4+nyrmO/+G/eYDYfpCVJaq7If4Fjg6dYRHxGX14ENODh5KIZ1FAhck6
	 a2Jx+svRun1d9h67v5i4DLd6kVsq8bosghzlx06SnWtYLcW4BM6XSJYYqZ+K7RoZdc
	 /R2MQS++OxyDnxDIUz6Nt36tKgL5YysX+5NmO88XNdd8UhwPqk8AAAT/CaJh/Bp1aI
	 oP1RW2llAeeEA==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCwXwrD1060387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:58:34 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:58:33 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 20:58:33 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMi8yXSBzdGFnaW5nOiBpM2M6IGFkZCBSZWFsdGVrIFJUUzQ5MHggSTNDIEhVQiBkcml2ZXI=?=
Thread-Topic: [PATCH 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Thread-Index: AQHc2Jrbqbpl5NdpHESZuLYaRhWZD7X9bHOAgCFtvPA=
Date: Mon, 25 May 2026 12:58:33 +0000
Message-ID: <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <20260430121354.6253-2-zain_zhou@realsil.com.cn>
 <2026050412-bush-rosy-959d@gregkh>
In-Reply-To: <2026050412-bush-rosy-959d@gregkh>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_135847_513091_0EFE6954 
X-CRM114-Status: UNSURE (   5.84  )
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

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQpXZSBub3RpY2VkIHRoYXQgdGhlIE5YUCBQM0gy
eDR4IHNlcmllcyAodjEwKSBpbnRyb2R1Y2VzIGEgZ2VuZXJpYw0KSTNDIGh1YiBmcmFtZXdvcmsu
IFdvdWxkIHlvdSByZWNvbW1lbmQgd2FpdGluZyBmb3IgdGhhdCB0byBsYW5kDQpiZWZvcmUgcmVz
dWJtaXR0aW5nIHRvIHRoZSBwcm9wZXIgbG9jYXRpb24/DQoNCg0KQmVzdCBSZWdhcmRz77yMDQpa
YWluIFpob3Ug5ZGo5a+FDQpSZWFsc2lsIE1pY3JvZWxlY3Ryb25pY3MgQ08uIExURC4NCkUtbWFp
bOKciSA6IHphaW5femhvdUByZWFsc2lsLmNvbS5jbg0KLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
