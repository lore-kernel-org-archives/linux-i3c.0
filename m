Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93392C3DA63
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jul 2024 01:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlAB2IR3GMN19YQ/iHVXWDSxc9nbKJF2LW9TmPQP/GA=; b=NOebAy0mVz49lT
	E85w9AJuviWkHw95edFC8aWxZVO9suPaYPdKekRTwuhb8pbJI9ZM4PSuUy35Mkf1aGKBoMbYt8Bm3
	D7Lkn9eWiOgDzaMwawrwaEM55meeR++/ay+uTDo5agvpwMWRQNobmVTyJ91i6oayjmsZ+zVQeyAJZ
	85y4hECBEBdEoyuQXWxh2b6L6Umo08lxxwfJwpJhZYE26jAxtfbGq9hX/adv8q+i8kzU6DWoqSAJ+
	NwCFyyVJPyD9z1UrMbsOWAkagif+KqCmMChzm0RbF1/8ZCEcXisusFDnMhqzwz5wv0pyR86r/Hgor
	1qiFD/iaxXNsGapWt72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWneW-0000000H3Cf-2op6;
	Thu, 25 Jul 2024 01:52:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWneT-0000000H3BW-47iO
	for linux-i3c@lists.infradead.org;
	Thu, 25 Jul 2024 01:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721872329;
	bh=Z3ooCPkfUhbJkl7PxDObcq/dMiqmdHgfLl7Tb+HWoe4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WRMoVOAfRkT90uvkWi0GHYSYwFda8xGZaEMIPhM+q5x/OYIc7J873svet3gR6Vy2s
	 4yUmDgCQN5bS/6gm55jN4ZIpyzBXKMqUT+as8TABn7pXyWMme18tyq0B1gFxNMbVQh
	 TrTJ59vnDApwxk+iaokaA4Vu39+AzmGXH+oDaV29oi26zH4BQDoB573ddb3RVcYYpj
	 Wd7Y1DykOjTPtt1r6sf7VNiDfAGZVJiraMemxmEz80XTCAlzMY8NuEMEQLAJJ449E/
	 vEYTCgQ4sjAwbZjcilQy0oDrfVzl6skZqK0Tvuyg4a/Chkd+mzvDuGFsVm5T9gSGxn
	 e15eA84pfxOFA==
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED42B66AB4;
	Thu, 25 Jul 2024 09:52:07 +0800 (AWST)
Message-ID: <3483626b81037205679c4d38678f2e3529d53e14.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] i3c: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Steven Niu <steven.niu.uj@renesas.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "linux-i3c@lists.infradead.org"
 <linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Cc: "zbigniew.lukwinski@linux.intel.com"
 <zbigniew.lukwinski@linux.intel.com>,  Alejandro Gonzalez
 <alejandro.gonzalez.wg@renesas.com>
Date: Thu, 25 Jul 2024 09:52:07 +0800
In-Reply-To: <TYTPR01MB109893062FB3F0D4141444219BAAA2@TYTPR01MB10989.jpnprd01.prod.outlook.com>
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
	 <20240217131412.4145506-2-steven.niu.uj@renesas.com>
	 <bae054d217aa577838593244eda02b008e3749a5.camel@codeconstruct.com.au>
	 <TYTPR01MB109893062FB3F0D4141444219BAAA2@TYTPR01MB10989.jpnprd01.prod.outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_185218_269719_FE7884C5 
X-CRM114-Status: GOOD (  25.63  )
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

SGkgU3RldmVuLAoKPiBBcG9sb2dpemUgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIGFtIG91dCBvZiB3
b3JrIGZvciBhIGxvbmcgdGltZQo+IGJlY2F1c2Ugb2YgbXkgcGVyc29uYWwgZW1lcmdlbmN5LiBJ
IGFtIGJhY2sgYXQgd29yayBub3cuCgpObyBwcm9ibGVtIGF0IGFsbDsgU29ycnkgdG8gaGVhciBp
dCwgSSBob3BlIHRoaW5ncyBhcmUgb2theSBub3cuIFRoYW5rcwpmb3IgZ2V0dGluZyBiYWNrIHRv
IG1lIHRob3VnaCEKCj4gV2UgYXJlIHdvcmtpbmcgb24gdGhlIGZvbGxvd2luZyBpdGVtcyBhZnRl
ciB0aGUgZmlyc3Qgc3VibWl0IG9mIHRoZQo+IHBhdGNoOgo+IDEuIE1vZGlmeSB0aGUgYmluZGlu
ZyBmaWxlIHRvIG1ha2UgaXQgZm9jdXNlZCBvbiB0aGUgZGV2aWNlCj4gZGVzY3JpcHRpb24gaW5z
dGVhZCBvZiBkcml2ZXIgZGVzY3JpcHRpb24uCj4gMi4gRml4IHRoZSBjb2RlcyB3aGljaCBkb2Vz
bid0IGZvbGxvd2luZyB0aGUga2VybmVsIGRldmVsb3BtZW50Cj4gcnVsZXMuCj4gMy4gUmUtaW1w
bGVtZW50IHRoZSBTTUJ1cyBBZ2VudCBmdW5jdGlvbiB3aXRoIElCSSBtZWNoYW5pc20gaW5zdGVh
ZAo+IG9mIHBvbGxpbmcuIAo+IMKgwqAgU01CdXMgQWdlbnQgZnVuY3Rpb24gcmVxdWlyZXMgdGhl
IGRyaXZlciB0byBjaGVjayB0aGUgc3RhdHVzCj4gcmVnaXN0ZXIgb2YgdGhlIEkzQyBodWIuIFBv
bGxpbmcgdGhlIHN0YXR1cyByZWdpc3RlciBvdmVyIEkzQyBidXMKPiBleGhhdXN0cyB0b28gbXVj
aCBidXMgcmVzb3VyY2VzLiBJM0MgSHViIHN1cHBvcnRzIHJlcG9ydGluZyBzdGF0dXMKPiBjaGFu
Z2VzIHdpdGggSUJJLiBUaGlzIHNoYWxsIGJlIHN1cHBvcnRlZCBpbiB0aGUgZHJpdmVyLgo+IDQu
IFJlbW92ZSB0aGUgaTJjIHNsYXZlLW1xdWV1ZSBtb2R1bGUuIAo+IMKgwqAgVGhlIHNsYXZlLW1x
dWV1ZSBtb2R1bGUgaXMgdXNlZCB0byBwcm92aWRlIGEgdXNlciBpbnRlcmZhY2UgZm9yCj4gU01C
dXMgQWdlbnQgc2xhdmUgZnVuY3Rpb24uIEJ1dCBpdCBoYXMgbm90IGJlZW4gaW5jbHVkZWQgaW4g
dXBzdHJlYW0uCj4gCj4gVGhlIGZpcnN0IHR3byBpdGVtcyBoYXZlIGJlZW4gZmluaXNoZWQuIEFu
ZCB3ZSBhcmUgd29ya2luZyBvbiB0aGUgIzMKPiBhbmQgIzQuIAoKT0ssIHNvdW5kcyBnb29kLiBJ
IGhhdmUgYSBmZXcgc3RydWN0dXJhbCBzdWdnZXN0aW9uczsgc29tZSBvZiB0aGVzZSBoYXZlCmJl
ZW4gY292ZXJlZCBieSBvdGhlcnMnIHJldmlld3MgdG9vLCBidXQgdG8gc3VtbWFyaXNlOgoKU3Bl
Y2lmaWNpdHk6IGl0IGxvb2tzIGxpa2UgeW91J3JlIHByb3Bvc2luZyB0aGlzIGFzIGEgZ2VuZXJp
YyBpM2MgaHViCmRyaXZlciwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRoZSBjYXNlOyBhcyBm
YXIgYXMgSSBjYW4gdGVsbCwgaXQncyBhClJlbmVzYXMtc3BlY2lmaWMgZGVzaWduIChhbmQgSU8g
aW50ZXJmYWNlKSwgc28geW91IHdhbnQgdG8gcmVmbGVjdCB0aGF0CmluIHRoZSBuYW1pbmcgJiBj
b25maWcgb3B0aW9ucy4KCndoaWNoIGxlYWRzIHRvOgoKQmluZGluZzogdGhlIGRyaXZlciBjYW5u
b3QgbWF0Y2ggb24gdGhlIEkzQyBodWIgY2xhc3MgQkNSLCBhcyB0aGF0CmRvZXNuJ3Qgc3BlY2lm
eSBhbnkgc29ydCBvZiByZWdpc3Rlci9iZWhhdmlvdXJhbCBpbnRlcmZhY2UuIElmIGFub3RoZXIK
aGFyZHdhcmUgaHViIHdhcyBpbXBsZW1lbnRlZCwgdXNpbmcgdGhlIHNhbWUgY2xhc3MgQkNSLCB0
aGlzIGRyaXZlcgp3b3VsZCBjb25mbGljdC4gWW91J2xsIG5lZWQgdG8gbWF0Y2ggb24gdmVuZG9y
L2RldmljZSBJRHMgaW5zdGVhZC4KCkV4aXN0aW5nIGluZnJhc3RydWN0dXJlOiB5b3UncmUgcmUt
aW1wbGVtZW50aW5nIGEgZmV3IGNvbW1vbiBiaXRzIG9mCmtlcm5lbCBpbmZyYXN0cnVjdHVyZSB3
aXRoIHRoaXMgY2hhbmdlOyBmb3IgZXhhbXBsZSB0aGUgTERPIHNldHRpbmdzIGNhbgp1c2UgdGhl
IHJlZ3VsYXRvciBkZXZpY2VzIGluc3RlYWQuIElzIHRoaXMgaW5jbHVkZWQgaW4geW91ciAoMikg
cG9pbnQKYWJvdmU/CgpDb25maWd1cmF0aW9uOiBhcyB5b3UndmUgbm90ZWQsIHRoZSBydW4tdGlt
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSBkZXZpY2UKZG9lc24ndCBiZWxvbmcgaW4gdGhlIGRldmlj
ZSB0cmVlIGJpbmRpbmcgaW4gbW9zdCBjYXNlcy4gSW4gZml4aW5nCnRob3NlLCB0aGVyZSBhcmUg
YSBjb3VwbGUgb2YgYXBwcm9hY2hlczoKCiAqIHdoZW4gbW92aW5nIHRvIGV4aXN0aW5nIGluZnJh
c3RydWN0dXJlIChmb3IgZXhhbXBsZSwgdGhlIHJlZ3VsYXRvcsKgCiAgIGFuZC9vciBwaW5jdHJs
IGRldmljZXMpLCB0aGUgY29uc3VtZXJzIG9mIHRob3NlIGRldmljZXMgY2FuIHJlcXVlc3QKICAg
dGhlIGNvcnJlY3QgY29uZmlndXJhdGlvbiBhbnl3YXksIHNvIHlvdSBkb24ndCBuZWVkIHRvIHdv
cnJ5IGFib3V0CiAgIHRoZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIGNob3NlbgoKICogZm9yIG90
aGVyIHJ1bnRpbWUgdGhpbmdzLCBzdWNoIGFzIHRoZSBkb3duc3RyZWFtIHBvcnQgY29uZmlndXJh
dGlvbgogICAoaW4gaTNjIG1vZGUgdnMuIFNNQnVzIEFnZW50IG1vZGUpIG1heSBiZSBiZXR0ZXIg
ZXhwb3NlZCB2aWEgY29uZmlnZnMKCiAqIGZvciB0aGluZ3MgdGhhdCBkbyBiZWxvbmcgYXMgbmV3
IHByb3BlcnRpZXMgaW4gdGhlIGRldmljZSB0cmVlLCB5b3UKICAgd2FudCBudW1lcmljIHZhbHVl
cyAod2l0aCBhbiBhcHByb3ByaWF0ZWx5IG5hbWVkIHByb3BlcnR5KSByYXRoZXIKICAgdGhhbiBz
dHJpbmdzLgoKICogdGhlcmUgbWF5IGJlIG90aGVyIGNvbmZpZ3VyYXRpb24gc2V0dGluZ3MgdGhh
dCBkb24ndCBzaXQgd2VsbCBpbgogICBhYm92ZSBjYXRlZ29yaWVzLCBiZXN0IHRvIGRpc2N1c3Mg
dGhvc2UgaGVyZS4KClNNQnVzIEFnZW50IGkyYyBpbnRlcmZhY2U6IHRoZSBjb250cm9sbGVyIHNp
ZGUgbG9va3MgZmluZSwgYnV0IHRoZQpkZXZpY2Ugc2lkZSBzaG91bGQgYmUgaW1wbGVtZW50ZWQg
YXMgaTJjX3NsYXZlX2V2ZW50KCkgZXZlbnRzIG9uIHRoZQpzYW1lIGNvbnRyb2xsZXJzIHJhdGhl
ciB0aGFuIHRoZSBpMmMtbXF1ZXVlIGRldmljZSAod2hpY2ggaXNuJ3QKdXBzdHJlYW0sIGFuZCBk
b2Vzbid0IGxvb2sgbGlrZWx5IHRvIGJlKS4KCkhhcHB5IHRvIHByb3ZpZGUgc3BlY2lmaWMgZmVl
ZGJhY2sgYXMgeW91IGdvLCBidXQgaXQncyB0aGUgbWFpbnRhaW5lcnMKKEFsZXhhbmRyZSBhbmQg
S3J6eXN6dG9mKSB0aGF0IHdpbGwgaGF2ZSB0aGUgZmluYWwgc2F5IGluIGRlc2lnbiBhbmQKc3R5
bGUgZGVjaXNpb25zLgoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
