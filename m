Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA20C4167D
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M84jtLfS6Z2jqQkN+cw469dGksiA4CK73qK6Cv7/U6g=; b=Le8FJtTAb0YGCD
	4cOdJsaKjPMQCnBA0OoRxStoCOexfaqfggAc+3JDNOiUpuXteVFUxLwFwZz0tGrTfxQ1YcUNx19K3
	huU4RBbCrDPXva82OUB3aG5XsQkqpYUB18aC8NEL3rN5xPiasUoZpsltGmDdzkknX+iRWdiogtgxV
	LLxOvOhczuWtpYU4jKxsDw0yzQpuM1rggU1K9jlrdtq01hlMRCgj4s10n9uFIJlheGMmMxN9fofMD
	CIattuiesLNoEw0THTJxETzhhdshX48YG2KzZ6+Aszm0pArlBRVmnDvkwUtF9HM0axLtu/vdq6FZQ
	WPkAl3xTCFfcMg71RA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pE0-00FR8I-0o;
	Tue, 14 Nov 2023 08:56:48 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pDw-00FR70-1d
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 08:56:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16B3F1BF20E;
	Tue, 14 Nov 2023 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699952202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zGZ4sq00jQphO6lz9A63nJTBqIRDe3wj/ZCR/VS6Es=;
	b=EYa+tHQNKe3Jw7paRiABoFWPI8doBiWqgY3OHa/XjRP4Ksgb0RPJ+0Q2pBoywZKETNJK4Q
	gTVv/o7RVbgMdLArGcm+7gs+A5Q1Hc7eOiGtwrIep2+7GYFww4LU2uz+Y9n6+X38hiuSh4
	grHAjP4JefRl5tabIBOUvLTX3X5VYmMud4rsrATyZAjFS2QZNiCmgJ83raZqSZxfdUTWE8
	XaIEAgtQsb4YqOOQ+cql0FLTyaBb4NjamNhZ27EgxJn6sI+0zVDzIKzKbAjCE23AoKKwR0
	k7jItHOLgzxa9MdRN3qINJ8VPIm39fVgTvDh90iecqr4IgHNJh8ZrlsEpd62Wg==
Date: Tue, 14 Nov 2023 09:56:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] i3c: Add fallback method for GETMXDS CCC
Message-ID: <20231114095641.1068437e@xps-13>
In-Reply-To: <d0e473f3-7b05-2d18-9874-eb9fe26f8478@starfivetech.com>
References: <20231114033430.9623-1-joshua.yeong@starfivetech.com>
	<20231114033430.9623-2-joshua.yeong@starfivetech.com>
	<20231114091956.0b8dd6c5@xps-13>
	<d0e473f3-7b05-2d18-9874-eb9fe26f8478@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_005644_958807_88A00685 
X-CRM114-Status: GOOD (  27.92  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gVHVlLCAx
NCBOb3YgMjAyMyAxNjo0Mjo0NCArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDE0LU5vdi0y
MyA0OjE5IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgSm9zaHVhLAo+ID4KPiA+IGpv
c2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tIHdyb3RlIG9uIFR1ZSwgMTQgTm92IDIwMjMgMTE6
MzQ6MzAgKzA4MDA6Cj4gPiAgCj4gPj4gU29tZSBJM0MgaGFyZHdhcmUgd2lsbCByZXBvcnQgZXJy
b3Igd2hlbiBpbmNvcnJlY3QgbGVuZ3RoIGlzIHJlY2VpdmVkIGZyb20gIAo+ID4gCQkJCQlhbgo+
ID4gIAo+ID4+IGRldmljZS4gR0VUTVhEUyBDQ0MgYXJlIGF2YWlsYmxlIGluIDIgZm9ybWF0czsg
d2l0aG91dCB0dXJuYXJvdW5kIHRpbWUgIAo+ICAoZm9ybWF0Cj4gPiAJCQkgIGF2YWlsYWJsZQkJ
Ogo+ID4gIAo+ID4+IDEpIGFuZCB3aXRoIHR1cm5hcm91bmQgdGltZSAoZm9ybWF0IDIpLiBUaGVy
ZSBpcyBubyBtZWNoYW5pY3MgdG8gZGV0ZXIgIAo+IG1pbmUgd2hpY2gKPiA+PiBmb3JtYXQgaXMg
c3VwcG9ydGVkIGJ5IGRldmljZS4gSW4gY2FzZSBzZW5kaW5nIEdFVE1YRFMgQ0NDIGZvcm1hdCAy
IHJlICAKPiBzdWx0ZWQKPiA+IAkJCQlTbyBpbiBjYXNlPwo+ID4gIAo+ID4+IGZhaWx1cmUsIHRy
eSBzZW5kaW5nIEdFVE1YRFMgQ0NDIGZvcm1hdCAxIGluc3RlYWQuICAKPiA+IGluIGEKPiA+ICAK
PiA+PiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRl
Y2guY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAxMiArKysrKysr
KysrLS0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLmMKPiA+PiBpbmRleCAwY2RjOTRlNGNiNzcuLjJmYzA0ZDk3ZjA3ZSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4+ICsrKyBiL2RyaXZlcnMvaTNj
L21hc3Rlci5jCj4gPj4gQEAgLTEwOTksOCArMTA5OSwxNiBAQCBzdGF0aWMgaW50IGkzY19tYXN0
ZXJfZ2V0bXhkc19sb2NrZWQoc3RydWN0IGkzYyAgCj4gX21hc3Rlcl9jb250cm9sbGVyICptYXN0
ZXIsCj4gPj4gICA+PiAgIAlpM2NfY2NjX2NtZF9pbml0KCZjbWQsIHRydWUsIEkzQ19DQ0NfR0VU
TVhEUywgJmRlc3QsIDEpOyAgCj4gPj4gICAJcmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRf
bG9ja2VkKG1hc3RlciwgJmNtZCk7Cj4gPj4gLQlpZiAocmV0KQo+ID4+IC0JCWdvdG8gb3V0Owo+
ID4+ICsJaWYgKHJldCkgewo+ID4+ICsJCS8qICAKPiA+IAkJIF4KPiA+IFdyb25nIGFsaWdubWVu
dCBvZiB0aGUgc3RhcnRzIGJlbG93Cj4gPiAJCXYgIAo+ID4+ICsJCSogUmV0cnkgd2hlbiB0aGUg
ZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgbWF4IHJlYWQgdHVybmFyb3VuZAo+ID4+ICsJCSogd2hp
bGUgZXhwZWN0aW5nIHNob3J0ZXIgbGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZCAgCj4gPiBw
ZXJpb2Q/Cj4gPiAgCj4gPj4gKwkJKi8KPiA+PiArCQlkZXN0LT5wYXlsb2FkLmxlbiAtPSAzOwo+
ID4+ICsJCXJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQp
Owo+ID4+ICsJCWlmIChyZXQpCj4gPj4gKwkJCWdvdG8gb3V0Owo+ID4+ICsJfSAgCj4gPiBJIGJl
bGlldmUgdGhpcyBpcyBhIHBlci1kZXZpY2UgY29uZmlndXJhdGlvbiBhbmQgd2Ugc2hvdWxkIHNh
dmUgdGhpcyBpbgo+ID4gb3JkZXIgdG8gb25seSBmYWlsIG9uY2UsIG5vPyAgCj4gCj4gVGhpcyBi
ZWhhdmlvciBkZXBlbmRzIG9uIHRoZSBoYXJkd2FyZSBkZXNpZ25lZCB3aGV0aGVyIGl0IHdpbGwg
cmV0dXJuIGFuIGVycm9yCj4gaW4gY2FzZSBvZiBzaG9ydGVyIGxlbmd0aCBmcm9tIGkzYyBkZXZp
Y2VzIGluIGRlc3QtPnBheWxvYWQubGVuLiBJIG1hZGUgaXQgc28gaXQKPiB3aWxsIHJldHJ5IGJ5
IGV4cGVjdGluZyBhIHNob3J0ZXIgbGVuZ3RoIGluc3RlYWQsIGluIGNhc2UgaXQgc3RpbGwgZmFp
bHMgdGhlbgo+IGl0IG1lYW5zIEdFVE1YRFMgQ0NDIHJlYWxseSBmYWlsZWQuCgpZZXMsIEkgZ290
IHRoZSBsb2dpYy4KCj4gV2UgZG8gbm90IGhhdmUgdG8gaW5pdGlhbGl6ZSB0aGUgc2FtZSBoYXJk
d2FyZSB0d2ljZSBhbmQgZG8gR0VUTVhEUyBDQ0MgbQo+IG9yZQo+IHRoYW4gb25jZSBhcyBmYXIg
YXMgSSBrbm93PwoKSSBkb24ndCByZW1lbWJlci4gSWYgeW91IHNheSBzbywgdGhlbiBpdCdzIGZp
bmUgbGlrZSB0aGlzLgoKPiA+PiAgID4+ICAgCWlmIChkZXN0LnBheWxvYWQubGVuICE9IDIgJiYg
ZGVzdC5wYXlsb2FkLmxlbiAhPSA1KSB7ICAKPiA+PiAgIAkJcmV0ID0gLUVJTzsgIAoKVGhhbmtz
LApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWkzYwo=
