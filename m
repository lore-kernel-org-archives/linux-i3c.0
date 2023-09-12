Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016BCA0EC3
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Sep 2023 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H72OyUaVQYBE9l5V+WZKOrGUrLhNV7MpISaBZoNw2c4=; b=r/h3UFAdDPz8n6
	cKVy6CZRToaoezZlhOjwZ/ckW4wLnw+BGw2Cmh9vT2uno62o8PuhI9ptJdqK1Qoht/AuMwjfc7OAh
	zUc5bu+nr2elJa6P6pqQYKHfJk2tgLHhePcDw1oEjsHrKdQeEBrSpmViyw4LsfDxaUsDPGOp04oDb
	rYi0ETSKGxM1G35TY5BsHpbIeQ7l/+oOztTxYe8r6G1SNEbHzakT5mNv3KKm66a92cjm8GFem7+t3
	9/RCYV+KkoLqyofJSleQUatsM+4TE1FUFcrAPk/qNQ6So+r9HW359umM++XyNxV0DyiONYioBljrb
	2f0Vw+AWtg0yvg9O3QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1Fs-003AXK-2O;
	Tue, 12 Sep 2023 11:08:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1Fq-003ARM-05
	for linux-i3c@lists.infradead.org;
	Tue, 12 Sep 2023 11:08:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C0831BF213;
	Tue, 12 Sep 2023 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694516902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EF3h98Mdqj31ieacBiceRbGocGI1mqvvI0enRLJAJ9U=;
	b=kDP44VJdI1tNdv9kVJvfwvKf+lFYfaKh5p2qJw1LiqypQuX0QJeZ2hEfctV4NiN7f2F/jn
	qLW9QUtcyeOypXKAU909WmoO2WXaqgWPS63eav3gY0d7NP9+QuAItO+TOwaoCV7heqcHzf
	LjlwoXP92KhpahnlNF6JGNNA24jyTbUAv8dAoyI68Sssix6LeClfCDwrXP7UaZ6t4uOIFr
	B06GbiMWaJKSGuRg4zz+i02aggTcNklhy23xAnX5ta/hV6ptRERpI2SLL5SniqKzqP6UxI
	TbmqW0WLpFVt690hNce9WzxaqNvmR44Gzwop7xD0KhFwaALKdSiJUWhwLRAqGQ==
Date: Tue, 12 Sep 2023 13:08:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] i3c: Add fallback method for GETMXDS CCC
Message-ID: <20230912130821.21edfafc@xps-13>
In-Reply-To: <20230911082456.23239-2-joshua.yeong@starfivetech.com>
References: <20230911082456.23239-1-joshua.yeong@starfivetech.com>
	<20230911082456.23239-2-joshua.yeong@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_040826_332586_D2E5B964 
X-CRM114-Status: GOOD (  22.30  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gTW9uLCAx
MSBTZXAgMjAyMyAxNjoyNDo1NiArMDgwMDoKCj4gU29tZSBJM0MgaGFyZHdhcmUgd2lsbCByZXBv
cnQgZXJyb3Igd2hlbiBpbmNvcnJlY3QgbGVuZ3RoIGlzIHJlY2VpdmVkIGZyb20KPiBkZXZpY2Uu
IEdFVE1YRFMgQ0NDIGFyZSBhdmFpbGJsZSBpbiAyIGZvcm1hdHM7IHdpdGhvdXQgdHVybmFyb3Vu
ZCB0aW1lIChmb3JtYXQKPiAxKSBhbmQgd2l0aCB0dXJuYXJvdW5kIHRpbWUgKGZvcm1hdCAyKS4g
VGhlcmUgaXMgbm8gbWVjaGFuaWNzIHRvIGRldGVybWluZSB3aGljaAo+IGZvcm1hdCBpcyBzdXBw
b3J0ZWQgYnkgZGV2aWNlLiBJbiBjYXNlIHNlbmRpbmcgR0VUTVhEUyBDQ0MgZm9ybWF0IDIgcmVz
dWx0ZWQKPiBmYWlsdXJlLCB0cnkgc2VuZGluZyBHRVRNWERTIENDQyBmb3JtYXQgMSBpbnN0ZWFk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8am9zaHVhLnllb25nQHN0YXJmaXZl
dGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgIHwgMzMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvbGludXgvaTNjL2NjYy5oIHwgMTcg
KysrKysrKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2Ry
aXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggODcyODNlNGE0NjA3Li4wODRmNjRiZWYxNTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+IEBAIC0xMDg4LDEwICsxMDg4LDM3IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9nZXRt
eGRzX2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gIAkJCQkg
ICAgIHN0cnVjdCBpM2NfZGV2aWNlX2luZm8gKmluZm8pCj4gIHsKPiAgCXN0cnVjdCBpM2NfY2Nj
X2dldG14ZHMgKmdldG1heGRzOwo+ICsJc3RydWN0IGkzY19jY2NfZ2V0bXhkc190dXJuYXJvdW5k
ICpnZXRtYXhkc190YTsKPiAgCXN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0IGRlc3Q7Cj4gIAlzdHJ1
Y3QgaTNjX2NjY19jbWQgY21kOwo+ICAJaW50IHJldDsKPiAgCj4gKwlnZXRtYXhkc190YSA9IGkz
Y19jY2NfY21kX2Rlc3RfaW5pdCgmZGVzdCwgaW5mby0+ZHluX2FkZHIsCj4gKwkJCQkJIHNpemVv
ZigqZ2V0bWF4ZHNfdGEpKTsKPiArCWlmICghZ2V0bWF4ZHNfdGEpCj4gKwkJcmV0dXJuIC1FTk9N
RU07Cj4gKwo+ICsJaTNjX2NjY19jbWRfaW5pdCgmY21kLCB0cnVlLCBJM0NfQ0NDX0dFVE1YRFMs
ICZkZXN0LCAxKTsKPiArCXJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChtYXN0
ZXIsICZjbWQpOwo+ICsJaWYgKHJldCkgewo+ICsJCWdvdG8gYWx0ZXJuYXRpdmU7Cj4gKwl9Cj4g
Kwo+ICsJaWYgKGRlc3QucGF5bG9hZC5sZW4gIT0gMiAmJiBkZXN0LnBheWxvYWQubGVuICE9IDUp
IHsKCkNhbiBsZW4gYmUgMiBoZXJlPwoKPiArCQlyZXQgPSAtRUlPOwo+ICsJCWdvdG8gb3V0Owo+
ICsJfQo+ICsKPiArCWluZm8tPm1heF9yZWFkX2RzID0gZ2V0bWF4ZHNfdGEtPm1heHJkOwo+ICsJ
aW5mby0+bWF4X3dyaXRlX2RzID0gZ2V0bWF4ZHNfdGEtPm1heHdyOwo+ICsJaWYgKGRlc3QucGF5
bG9hZC5sZW4gPT0gNSkKPiArCQlpbmZvLT5tYXhfcmVhZF90dXJuYXJvdW5kID0gZ2V0bWF4ZHNf
dGEtPm1heHJkdHVyblswXSB8Cj4gKwkJCQkJICAgICgodTMyKWdldG1heGRzX3RhLT5tYXhyZHR1
cm5bMV0gPDwgOCkgfAo+ICsJCQkJCSAgICAoKHUzMilnZXRtYXhkc190YS0+bWF4cmR0dXJuWzJd
IDw8IDE2KTsKCkRvbid0IHlvdSB3YW50IHRvIGF2b2lkIHRoZSAiYWx0ZXJuYXRpdmUiIGlmIGl0
IHdvcmtlZD8KCj4gKwo+ICthbHRlcm5hdGl2ZToKCkkgd291bGQgZXhwZWN0IGEgY29tbWVudCBz
b21ld2hlcmUgdG8gZXhwbGFpbiB0aGUgc3VidGxldHkuCgo+ICsJaTNjX2NjY19jbWRfZGVzdF9j
bGVhbnVwKCZkZXN0KTsKPiArCj4gIAlnZXRtYXhkcyA9IGkzY19jY2NfY21kX2Rlc3RfaW5pdCgm
ZGVzdCwgaW5mby0+ZHluX2FkZHIsCj4gIAkJCQkJIHNpemVvZigqZ2V0bWF4ZHMpKTsKPiAgCWlm
ICghZ2V0bWF4ZHMpCj4gQEAgLTExMDIsMTcgKzExMjksMTMgQEAgc3RhdGljIGludCBpM2NfbWFz
dGVyX2dldG14ZHNfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwK
PiAgCWlmIChyZXQpCj4gIAkJZ290byBvdXQ7Cj4gIAo+IC0JaWYgKGRlc3QucGF5bG9hZC5sZW4g
IT0gMiAmJiBkZXN0LnBheWxvYWQubGVuICE9IDUpIHsKPiArCWlmIChkZXN0LnBheWxvYWQubGVu
ICE9IDIpIHsKPiAgCQlyZXQgPSAtRUlPOwo+ICAJCWdvdG8gb3V0Owo+ICAJfQo+ICAKPiAgCWlu
Zm8tPm1heF9yZWFkX2RzID0gZ2V0bWF4ZHMtPm1heHJkOwo+ICAJaW5mby0+bWF4X3dyaXRlX2Rz
ID0gZ2V0bWF4ZHMtPm1heHdyOwo+IC0JaWYgKGRlc3QucGF5bG9hZC5sZW4gPT0gNSkKPiAtCQlp
bmZvLT5tYXhfcmVhZF90dXJuYXJvdW5kID0gZ2V0bWF4ZHMtPm1heHJkdHVyblswXSB8Cj4gLQkJ
CQkJICAgICgodTMyKWdldG1heGRzLT5tYXhyZHR1cm5bMV0gPDwgOCkgfAo+IC0JCQkJCSAgICAo
KHUzMilnZXRtYXhkcy0+bWF4cmR0dXJuWzJdIDw8IDE2KTsKPiAgCj4gIG91dDoKPiAgCWkzY19j
Y2NfY21kX2Rlc3RfY2xlYW51cCgmZGVzdCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
aTNjL2NjYy5oIGIvaW5jbHVkZS9saW51eC9pM2MvY2NjLmgKPiBpbmRleCBhZDU5YTRhZTYwZDEu
LjUwZWQ0MWQ0ZDVhMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oCj4gQEAgLTI2OSwxNCArMjY5LDI3IEBAIGVudW0g
aTNjX3RzY28gewo+ICAjZGVmaW5lIEkzQ19DQ0NfTUFYX1NEUl9GU0NMKHgpCQkoKHgpICYgSTND
X0NDQ19NQVhfU0RSX0ZTQ0xfTUFTSykKPiAgCj4gIC8qKgo+IC0gKiBzdHJ1Y3QgaTNjX2NjY19n
ZXRteGRzIC0gcGF5bG9hZCBwYXNzZWQgdG8gR0VUTVhEUyBDQ0MKPiArICogc3RydWN0IGkzY19j
Y2NfZ2V0bXhkcyAtIHBheWxvYWQgcGFzc2VkIHRvIEdFVE1YRFMgQ0NDIHdpdGhvdXQgdHVybmFy
b3VuZAo+ICsgKiAoZm9ybWF0IDEpCj4gKyAqCj4gKyAqIEBtYXh3cjogd3JpdGUgbGltaXRhdGlv
bnMKPiArICogQG1heHJkOiByZWFkIGxpbWl0YXRpb25zCj4gKyAqLwo+ICtzdHJ1Y3QgaTNjX2Nj
Y19nZXRteGRzIHsKPiArCXU4IG1heHdyOwo+ICsJdTggbWF4cmQ7Cj4gK30gX19wYWNrZWQ7Cj4g
Kwo+ICsvKioKPiArICogc3RydWN0IGkzY19jY2NfZ2V0bXhkc190YSAtIHBheWxvYWQgcGFzc2Vk
IHRvIEdFVE1YRFMgQ0NDIHdpdGggdHVybmFyb3VuZAo+ICsgKiAoZm9ybWF0IDIpCj4gICAqCj4g
ICAqIEBtYXh3cjogd3JpdGUgbGltaXRhdGlvbnMKPiAgICogQG1heHJkOiByZWFkIGxpbWl0YXRp
b25zCj4gICAqIEBtYXhyZHR1cm46IG1heGltdW0gcmVhZCB0dXJuLWFyb3VuZCBleHByZXNzZWQg
bWljcm8tc2Vjb25kcyBhbmQKPiAgICoJICAgICAgIGxpdHRsZS1lbmRpYW4gZm9ybWF0dGVkCj4g
ICAqLwo+IC1zdHJ1Y3QgaTNjX2NjY19nZXRteGRzIHsKPiArc3RydWN0IGkzY19jY2NfZ2V0bXhk
c190dXJuYXJvdW5kIHsKPiAgCXU4IG1heHdyOwo+ICAJdTggbWF4cmQ7Cj4gIAl1OCBtYXhyZHR1
cm5bM107CgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
