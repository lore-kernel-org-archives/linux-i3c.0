Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BB8C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TkKsWaB8v3wElngdXR1o6XYwz8wGq2tVZY/kFx2npI=; b=27WXSx5fuSlKEM
	2E4khdoRyGP2YZxT4+dcRQbTZk6XGIvOEiP9sbNtr2pw70w7neyFkuO1PSlF/ice1pXBMw+plQfII
	3TpUCr1ozuTmC0fOJpW8FIy+4rnrAjyDYkAioN0lCET4Ed0ygV9LUr78cz65GXCQkyMcCZ9NQr45j
	7UNqpkqKuSvW/3rZWRqBjBD7Q5jQaSJsfFv7FYnkZN8fucuXGKOGLKdSDmR/qzJ6Xh6zOQgI9G4wQ
	LNF1hny6fnciLu4OIRF6GYd/xvvdoY754pAmv4eiv6Q8Rhwzc2tnly0HVZs2Z3111DjwT9qIzmspK
	4JBqiEAkYtWPAa1TVjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWmU-0000000HSMA-2gUR;
	Fri, 23 Aug 2024 16:04:54 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWm7-0000000HSF0-3qJg
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:04:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7F221C0007;
	Fri, 23 Aug 2024 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mF0jJ+XEsMsD5uzCbms/Umdhg76zuMSa2D9a98I2W8I=;
	b=aoEsic4mvBwrZmCLdfeoItEW+UzVqev1VH0kORDjuuE7d2xIYkApkVl+hKqE/GTz6WZ7an
	LEjcRon50pIKvTdEchNepMY5SWGZANXT9Fj/NJWIkvzc34TrmCNF4nVzCjySYovpgHaYbw
	kLWg5pzHSkQV7egl3zX7VSzhr375K3FCM03Vn50AMgOrNmi1h6fi6fDvOBaU4DgbAwTm7q
	P7Bkse6b3/gQ53y66UGiZDZrpRZPC262rsN8Vh4oiUslPXNPRY7IX+4+RVansh4rBNC3t5
	D7FH9CPEfS5uyTh5nAZQL276rNEEVxZxZb6F0VPGw1gfgfWMCDkOHfofsQPVGQ==
Date: Fri, 23 Aug 2024 18:04:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 03/11] i3c: master: Extend address status bit to 4
 and add I3C_ADDR_SLOT_EXT_INIT
Message-ID: <20240823180426.056ac093@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090432_681407_E0095C7B 
X-CRM114-Status: GOOD (  20.38  )
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

SGkgRnJhbmssCgoKPiAgc3RhdGljIGJvb2wgaTNjX2J1c19kZXZfYWRkcl9pc19hdmFpbChzdHJ1
Y3QgaTNjX2J1cyAqYnVzLCB1OCBhZGRyKQo+ICB7Cj4gIAllbnVtIGkzY19hZGRyX3Nsb3Rfc3Rh
dHVzIHN0YXR1czsKPiBAQCAtMzg4LDYgKzQwNSwxNCBAQCBzdGF0aWMgaW50IGkzY19idXNfZ2V0
X2ZyZWVfYWRkcihzdHJ1Y3QgaTNjX2J1cyAqYnVzLCB1OCBzdGFydF9hZGRyKQo+ICAJZW51bSBp
M2NfYWRkcl9zbG90X3N0YXR1cyBzdGF0dXM7Cj4gIAl1OCBhZGRyOwo+ICAKPiArCS8qIHRyeSBm
aW5kIGFuIGFkZHJlc3MsIHdoaWNoIGhhdmUgbm90IHByZS1hbGxvY2F0ZWQgYnkgYXNzaWduZWQt
YWRkcmVzcyAqLwoKCVRyeQl0byBmaW5kCQkJaGFzICAgYmVlbgoKcHJlLWFsbG9jYXRlZD8KCj4g
Kwlmb3IgKGFkZHIgPSBzdGFydF9hZGRyOyBhZGRyIDwgSTNDX01BWF9BRERSOyBhZGRyKyspIHsK
PiArCQlzdGF0dXMgPSBpM2NfYnVzX2dldF9hZGRyX3Nsb3Rfc3RhdHVzX2V4dChidXMsIGFkZHIp
Owo+ICsJCWlmIChzdGF0dXMgPT0gSTNDX0FERFJfU0xPVF9GUkVFKQo+ICsJCQlyZXR1cm4gYWRk
cjsKPiArCX0KPiArCj4gKwkvKiB1c2UgcHJlLWFsbG9jb2F0ZWQgYnkgYXNzaWduZWQtYWRkcmVz
cyBiZWNhdXNlIHN1Y2ggZGV2aWNlIHdhcyByZW1vdmVkIGF0IGJ1cyovCgoJICBVc2UgICAgICBh
bGxvY2F0ZWQgCgpwcmUtYWxsb2NhdGVkIG9yIGFzc2lnbmVkPwoKSSBndWVzcyB0aGUgbG9naWMg
c2hvdWxkIGJlOgotIHRyeSB0aGUgYXNzaWduZWQtYWRkcmVzcwotIGxvb2sgZm9yIGEgZnJlZSBz
bG90Ci0gbG9vayBmb3IgYW4gYWxyZWFkeSBpbiB1c2Ugc2xvdCB0aGF0IG11c3QgY29uY2VybiBh
IGRpc2Nvbm5lY3RlZAogIGRldmljZQoKQnV0IHRoZSBjb21tZW50cyBhcmUgbm90IHByZWNpc2Ug
ZW5vdWdoIElNSE8uIENhbiB5b3UgcmVwaHJhc2UgdGhlbT8KCj4gIAlmb3IgKGFkZHIgPSBzdGFy
dF9hZGRyOyBhZGRyIDwgSTNDX01BWF9BRERSOyBhZGRyKyspIHsKPiAgCQlzdGF0dXMgPSBpM2Nf
YnVzX2dldF9hZGRyX3Nsb3Rfc3RhdHVzKGJ1cywgYWRkcik7Cj4gIAkJaWYgKHN0YXR1cyA9PSBJ
M0NfQUREUl9TTE9UX0ZSRUUpCj4gQEAgLTE5MDYsOSArMTkzMSw5IEBAIHN0YXRpYyBpbnQgaTNj
X21hc3Rlcl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4g
IAkJCWdvdG8gZXJyX3JzdGRhYTsKPiAgCQl9Cj4gIAo+IC0JCWkzY19idXNfc2V0X2FkZHJfc2xv
dF9zdGF0dXMoJm1hc3Rlci0+YnVzLAo+IC0JCQkJCSAgICAgaTNjYm9hcmRpbmZvLT5pbml0X2R5
bl9hZGRyLAo+IC0JCQkJCSAgICAgSTNDX0FERFJfU0xPVF9JM0NfREVWKTsKPiArCQlpM2NfYnVz
X3NldF9hZGRyX3Nsb3Rfc3RhdHVzX2V4dCgmbWFzdGVyLT5idXMsCj4gKwkJCQkJCSBpM2Nib2Fy
ZGluZm8tPmluaXRfZHluX2FkZHIsCj4gKwkJCQkJCSBJM0NfQUREUl9TTE9UX0kzQ19ERVYgfCBJ
M0NfQUREUl9TTE9UX0VYVF9JTklUKTsKPiAgCj4gIAkJLyoKPiAgCQkgKiBPbmx5IHRyeSB0byBj
cmVhdGUvYXR0YWNoIGRldmljZXMgdGhhdCBoYXZlIGEgc3RhdGljCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaTNjL21hc3Rlci5oIGIvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPiBp
bmRleCA0NjAxYjY5NTdmNzk5Li5jOTIzYjc2YmJjMzIxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvaTNjL21hc3Rlci5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPiBA
QCAtMjg0LDYgKzI4NCw4IEBAIGVudW0gaTNjX2J1c19tb2RlIHsKPiAgICogQEkzQ19BRERSX1NM
T1RfSTJDX0RFVjogYWRkcmVzcyBpcyBhc3NpZ25lZCB0byBhbiBJMkMgZGV2aWNlCj4gICAqIEBJ
M0NfQUREUl9TTE9UX0kzQ19ERVY6IGFkZHJlc3MgaXMgYXNzaWduZWQgdG8gYW4gSTNDIGRldmlj
ZQo+ICAgKiBASTNDX0FERFJfU0xPVF9TVEFUVVNfTUFTSzogYWRkcmVzcyBzbG90IG1hc2sKPiAr
ICogQEkzQ19BRERSX1NMT1RfRVhUX0lOSVQ6IHRoZSBiaXQgbWFzayBkaXNwbGF5IG9mIGFkZHJl
c3NlcyBpcyBwcmVmZXJyZWQgYnkgc29tZSBkZXZpY2VzLAoKSSdtIHNvcnJ5LCBidXQgSSBkb24n
dCB1bmRlcnN0YW5kIHdoYXQgImJpdCBtYXNrIGRpc3BsYXkgb2YgYWRkcmVzc2VzIgptZWFucy4K
Cj4gKyAqCQkJICAgIHN1Y2ggYXMgdGhlICJhc3NpZ25lZC1hZGRyZXNzIiBpbiBkZXZpY2UgdHJl
ZSBzb3VyY2UgKGR0cykuCj4gICAqCj4gICAqIE9uIGFuIEkzQyBidXMsIGFkZHJlc3NlcyBhcmUg
YXNzaWduZWQgZHluYW1pY2FsbHksIGFuZCB3ZSBuZWVkIHRvIGtub3cgd2hpY2gKPiAgICogYWRk
cmVzc2VzIGFyZSBmcmVlIHRvIHVzZSBhbmQgd2hpY2ggb25lcyBhcmUgYWxyZWFkeSBhc3NpZ25l
ZC4KPiBAQCAtMjk3LDkgKzI5OSwxMSBAQCBlbnVtIGkzY19hZGRyX3Nsb3Rfc3RhdHVzIHsKPiAg
CUkzQ19BRERSX1NMT1RfSTJDX0RFViwKPiAgCUkzQ19BRERSX1NMT1RfSTNDX0RFViwKPiAgCUkz
Q19BRERSX1NMT1RfU1RBVFVTX01BU0sgPSAzLAo+ICsJSTNDX0FERFJfU0xPVF9FWFRfU1RBVFVT
X01BU0sgPSA3LAo+ICsJSTNDX0FERFJfU0xPVF9FWFRfSU5JVCA9IEJJVCgyKSwKPiAgfTsKPiAg
Cj4gLSNkZWZpbmUgSTNDX0FERFJfU0xPVF9CSVRTIDIKPiArI2RlZmluZSBJM0NfQUREUl9TTE9U
X0JJVFMgNAo+ICAKPiAgLyoqCj4gICAqIHN0cnVjdCBpM2NfYnVzIC0gSTNDIGJ1cyBvYmplY3QK
PiAKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
