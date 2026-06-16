Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4ACD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YcZimk4sVnjpk1794kiJlA49makx0d/6IS4d5aIktY=; b=XlvYmNlC51ACTS
	N+MhtG5ikfo6Mh26TmkKt2u9duSK6wfBsBYp2ffYQ3rYZwKQZa1E0sekxmcAAMCuIH6bqir+ZhiOB
	ruirp5+30C5gRAFa9H1MSECz3XqyxWhxQnnO6SeZI/pcVdne4zSNwUg95wK/3ahgMukHUGbEmEQBm
	0D2B584/AukYRNDauCi59w8JG5+KzKYEbzE/G1evICtqIqm3sZ5Qd2S5YACJQbsHyh0MdCoiC0jFO
	CVIVSg/2/YQUGhRT983z8HNDTC9Q7T1SD0eYsT84FiISL2XKFnpRZw3WPcr7gu2yojG3auD3p86HK
	Qy/ZnrwijZF3MfdqPiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQr0-0000000FbBW-3gvV;
	Tue, 16 Jun 2026 10:17:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQqz-0000000FbA1-3tLF
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:17:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 984AB4047A;
	Tue, 16 Jun 2026 10:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2BD1F000E9;
	Tue, 16 Jun 2026 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605029;
	bh=EKmMWJCcYI6rOjOLTtJx1zGlMKl2tGx/GPxF/7QCcCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSLKqiCRyOrS+TzBfjgTLfPE3Fmg/xqAYhJLw0KJpA6wXkmYrMhTFDN2bnE0B25Y4
	 LZ8rcimc4AsHbFCwWSKR7By8PBKkyw766gPNgeMYJraGOSnpUaG8D3flurJqjTHgKi
	 eAHUh/wdTME8WkjuBUhxTtVeT8rcuGb5AlrcU/59+CjsaicOCO2OmzAYF2nMS+QXKh
	 6YRdAoY2///IfsjDhDmaX2x7Kel75x0jFfgkCVr5s3hOerh1wl8JBOI7rf233SFqmy
	 nkm43YFZDc2iZim+p67YnvT34/bBbte+vB4vEHc0/fFP/j/glpKTRwUJQ1xWAOT6yw
	 r3oaVSJ9xadaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] i3c: master: Use unified device property
 interface
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260616095429.3947205-3-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-3-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:17:08 +0000
Message-Id: <20260616101709.1B2BD1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtNZWRpdW1d
IFBlcm1hbmVudCBsZWFrIG9mIGZpcm13YXJlIG5vZGUgcmVmZXJlbmNlcyBpbiBJMkMgYW5kIEkz
QyBib2FyZGluZm8gc3RydWN0dXJlcy4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIERh
bmdsaW5nIHBvaW50ZXIgYGRlc2MtPmRldmAgY2F1c2VzIFVzZS1BZnRlci1GcmVlIG9uIGRldmlj
ZSB1bnJlZ2lzdHJhdGlvbiBpZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscy4KLS0KCmNvbW1pdCA4
OTQxOTIxNjc3NWUzM2ZiMmI4NTA5NDNhYTRhMjc4MWYxOTI3OGExCkF1dGhvcjogQWtoaWwgUiA8
YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KCmkzYzogbWFzdGVyOiBVc2UgdW5pZmllZCBkZXZpY2Ug
cHJvcGVydHkgaW50ZXJmYWNlCgpSZXBsYWNlIGFsbCBPRi1zcGVjaWZpYyBmdW5jdGlvbnMgd2l0
aCB1bmlmaWVkIGRldmljZSBwcm9wZXJ0eSBmdW5jdGlvbnMKYXMgYSBwcmVyZXF1aXNpdGUgdG8g
c3VwcG9ydCBib3RoIEFDUEkgYW5kIGRldmljZSB0cmVlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IDEwOWFhNTBlYjFm
OGYuLjNiMTlhNWU4ZjQ2ZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiAr
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpbIC4uLiBdCj4gQEAgLTE5MDIsNyArMTkwNCw4IEBA
IGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlcikKPiAgCQkJICAgICBkZXNjLT5pbmZvLnBpZCk7Cj4gIAo+ICAJCWlmIChk
ZXNjLT5ib2FyZGluZm8pCj4gLQkJCWRlc2MtPmRldi0+ZGV2Lm9mX25vZGUgPSBkZXNjLT5ib2Fy
ZGluZm8tPm9mX25vZGU7Cj4gKwkJCWRldmljZV9zZXRfbm9kZSgmZGVzYy0+ZGV2LT5kZXYsCj4g
KwkJCQkJZndub2RlX2hhbmRsZV9nZXQoZGVzYy0+Ym9hcmRpbmZvLT5md25vZGUpKTsKPiAgCj4g
IAkJcmV0ID0gZGV2aWNlX3JlZ2lzdGVyKCZkZXNjLT5kZXYtPmRldik7Cj4gIAkJaWYgKHJldCkg
ewoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgY2Fu
IHRoaXMgZXJyb3IgcGF0aCBjYXVzZSBhIHVzZS1hZnRlci1mcmVlCmFuZCBkb3VibGUtZnJlZT8K
CklmIGRldmljZV9yZWdpc3RlcigpIGZhaWxzLCBwdXRfZGV2aWNlKCkgaXMgY2FsbGVkIHdoaWNo
IGZyZWVzIHRoZSBtZW1vcnkKYmFja2luZyBkZXNjLT5kZXYsIGJ1dCB0aGUgZGVzYy0+ZGV2IHBv
aW50ZXIgaXMgbm90IHNldCB0byBOVUxMLgoKTGF0ZXIgZHVyaW5nIGNsZWFudXAsIHRoZSBkYW5n
bGluZyBwb2ludGVyIGJ5cGFzc2VzIHRoZSBOVUxMIGNoZWNrOgoKaTNjX21hc3Rlcl91bnJlZ2lz
dGVyX2kzY19kZXZzKCkgewogICAgLi4uCiAgICBpZiAoIWkzY2Rldi0+ZGV2KQogICAgICAgIGNv
bnRpbnVlOwoKICAgIGkzY2Rldi0+ZGV2LT5kZXNjID0gTlVMTDsKICAgIC4uLgp9CgpEb2VzIGRl
c2MtPmRldiBuZWVkIHRvIGJlIHNldCB0byBOVUxMIGFmdGVyIHB1dF9kZXZpY2UoKSB0byBwcmV2
ZW50IHRoaXM/CgpbIC4uLiBdCj4gQEAgLTI2MjMsMTQgKzI2MzAsMTQgQEAgb2ZfaTNjX21hc3Rl
cl9hZGRfaTJjX2JvYXJkaW5mbyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIs
Cj4gIAlib2FyZGluZm8tPmx2ciA9IHJlZ1syXTsKPiAgCj4gIAlsaXN0X2FkZF90YWlsKCZib2Fy
ZGluZm8tPm5vZGUsICZtYXN0ZXItPmJvYXJkaW5mby5pMmMpOwo+IC0Jb2Zfbm9kZV9nZXQobm9k
ZSk7Cj4gKwlmd25vZGVfaGFuZGxlX2dldChmd25vZGUpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9
CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIGNvZGUgbGVhayB0aGUgZndub2RlIHJlZmVy
ZW5jZT8KClRoZSByZXN1bHQgb2YgZndub2RlX2hhbmRsZV9nZXQoKSBpcyBjb21wbGV0ZWx5IGRp
c2NhcmRlZC4gU2luY2UKaTJjX25ld19jbGllbnRfZGV2aWNlKCkgc2VwYXJhdGVseSB0YWtlcyBh
bmQgZHJvcHMgaXRzIG93biBmd25vZGUgcmVmZXJlbmNlLApkb2VzIHRoaXMgaW5pdGlhbCByZWZl
cmVuY2UgcmVtYWluIHVucmVsZWFzZWQ/CgpbIC4uLiBdCj4gQEAgLTI2NzAsMTQgKzI2NzcsMTQg
QEAgb2ZfaTNjX21hc3Rlcl9hZGRfaTNjX2JvYXJkaW5mbyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250
cm9sbGVyICptYXN0ZXIsCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICAJYm9hcmRpbmZvLT5p
bml0X2R5bl9hZGRyID0gaW5pdF9keW5fYWRkcjsKPiAtCWJvYXJkaW5mby0+b2Zfbm9kZSA9IG9m
X25vZGVfZ2V0KG5vZGUpOwo+ICsJYm9hcmRpbmZvLT5md25vZGUgPSBmd25vZGVfaGFuZGxlX2dl
dChmd25vZGUpOwo+ICAJbGlzdF9hZGRfdGFpbCgmYm9hcmRpbmZvLT5ub2RlLCAmbWFzdGVyLT5i
b2FyZGluZm8uaTNjKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQoKW1NldmVyaXR5OiBNZWRpdW1d
CkRvZXMgdGhpcyBhbHNvIGxlYWsgdGhlIGZ3bm9kZSByZWZlcmVuY2U/CgpUaGUgcmVmZXJlbmNl
IGlzIGFjcXVpcmVkIGFuZCBzdG9yZWQgaW4gdGhlIGRldnJlcy1tYW5hZ2VkIGJvYXJkaW5mbwpz
dHJ1Y3R1cmUsIGJ1dCB0aGVyZSBzZWVtcyB0byBiZSBubyB0ZWFyZG93biBsb2dpYyBmb3IgdGhl
IG1hc3Rlci0+Ym9hcmRpbmZvCmxpc3RzIHRvIGRyb3AgaXQgYmVmb3JlIGRldnJlcyBmcmVlcyB0
aGVtLgoKQXMgc2VlbiBlYXJsaWVyIGluIGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZz
KCk6CgpkZXZpY2Vfc2V0X25vZGUoJmRlc2MtPmRldi0+ZGV2LCBmd25vZGVfaGFuZGxlX2dldChk
ZXNjLT5ib2FyZGluZm8tPmZ3bm9kZSkpOwoKQSBzZWNvbmQgcmVmZXJlbmNlIGlzIHRha2VuIHRo
ZXJlIHdoaWNoIGlzIHByb3Blcmx5IGRyb3BwZWQgYnkKaTNjX2RldmljZV9yZWxlYXNlKCksIGJ1
dCBkb2VzIHRoZSBmaXJzdCByZWZlcmVuY2Ugc3RvcmVkIGluCmJvYXJkaW5mby0+Zndub2RlIHJl
bWFpbiBzdHJhbmRlZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTYwOTU0MjkuMzk0NzIwNS0xLWFraGlscmFqZWV2QG52aWRp
YS5jb20/cGFydD0yCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
