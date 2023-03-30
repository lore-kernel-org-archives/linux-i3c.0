Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56648C761A6
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1tIS0qxvb3705KLtIa0jA1VXOUe1wR3OtiKzx0wPQ0=; b=J13CKvOSm/sdON
	WfIsHn8o9ebbITnbwCoXhrmDLn2YuMdQtQEYa0Q+4EVjFj/8L/ZOdMe7d8oowN468KW1KiYa5t36H
	4JFBkZEJtv1wOeK7CYtT8SiNd+DXIZSEfbNeQYyv9pgq6lyklayODTbcnXD/hFTgJTEG2bVXjUKN9
	cBqY0eEp6lPSDZkxOWxUFXOgN2XypQLV2kCEe30ETVvboAd7is+0bCghyBq1Ewf43OnkDzlCd1dfg
	hBgdCP1P9L5khFcwQx4cOw/Q52KQUNySWd+bUGhc4uzjAK6dMW8HL5nkxqP0HGteFeD1vi6KGHZ8+
	KYhpFAXzvmDdWNNmCTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phxQ0-004rtJ-1z;
	Thu, 30 Mar 2023 18:54:40 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phtVU-0047la-03
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 14:44:05 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id b18so23779519ybp.1
        for <linux-i3c@lists.infradead.org>; Thu, 30 Mar 2023 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680187434; x=1682779434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXYl+xj0Yw1bF4w8+SBVfRxZF4xXz6R1uvpK88nJQC8=;
        b=ONzip9KPUdUvbBZsRUcyOv+Hoc1GuB2htGz4prOHePVA4AkkStSVSsV5EPy9vm5d5D
         BeTWohzlN54Q29xjEGX2MBvFlr4QiSujOs2RNptq76oU7NKnwQRteEbGEILq5YmWP36z
         9hWGaJoTP1uLzNK0da+XNG5kVkGzlbjkMV78+RwBASRcgk9Uvyp/M+BvEiBOAzRb+uAR
         a0WcGCIzi1F8FhuyjG7U+6cAlO/Lspp4cAJLJv7sxL5+HZ4LggrJs2wEf+l49AA4k+9J
         gx5ASTnxueEWbw/LgYUy5vykP+IhipJZum/rHVc63lktiFY2vz/yemMaQpnpgTrtU9Uq
         GBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187434; x=1682779434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXYl+xj0Yw1bF4w8+SBVfRxZF4xXz6R1uvpK88nJQC8=;
        b=KiuwAFa9lMqDRUdDIjrU7FfZMLNrfFHCXVx6fl4NyUHhlR9XJbILZ+/Yzf7b/huHpM
         B1Cg5K0OUgapS0gbUdrsBFvWcBWxXPaA/+5YDHLIdod/hOPtgn3ELvgp5KvE1g+LeOpW
         FMI2P0rKumRVg6J/di/cbxpUxdffu/AcRCnq9+Xd/Wy4k2plc2XePIZ9TrQxaeIANmkY
         P5BTgKn8P0vqO+SACTthr3CRXyCUMWKqAJugygZSQm+Fxwr8RW4JmI76otq4WNfAa/Se
         hPgCUbIbb6e2eKzmqtCeXhxOSztJeFbtoiWQTVCcf0cHaFS6SEkyR+ICiRXHorWcT5yd
         6M3Q==
X-Gm-Message-State: AAQBX9d8E78JlrYAWuGPrcctimPpw9yiQ2R3r4l6Isonx9q3kVy64NPJ
	ZQ7NWZI07hb/9U7cbGe+6HRO5WZLjUSDYf495INMEw==
X-Google-Smtp-Source: AKy350ZWvrt6LF6hQ0/UwUdP4t82nxFBl3kjZRX6glA7bowsDEsbwUIYdKR6Nwdm5IH/wO4Zzsg8GC5JUryW+xqMSAc=
X-Received: by 2002:a25:db43:0:b0:b7d:5a67:8c6e with SMTP id
 g64-20020a25db43000000b00b7d5a678c6emr6807042ybf.6.1680187434135; Thu, 30 Mar
 2023 07:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680160851.git.jk@codeconstruct.com.au>
In-Reply-To: <cover.1680160851.git.jk@codeconstruct.com.au>
From: Jack Chen <zenghuchen@google.com>
Date: Thu, 30 Mar 2023 10:43:43 -0400
Message-ID: <CALvyBcV9EnwgcuNXF=uUwdQZ=WHjmpinD=s0FkL=KC0OBTwXBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	Matt Johnston <matt@codeconstruct.com.au>, Vitor Soares <ivitro@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_074404_051607_8F94E37A 
X-CRM114-Status: GOOD (  17.63  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 11:54:38 -0700
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

SGkgSmVyZW15LApUaGFua3MgZm9yIHRoZSBjaGFuZ2UsIGVzcGVjaWFsbHkgSUJJIGZlYXR1cmVz
IGluIG90aGVyIHRocmVhZHMuCkZyb20gbXkgdW5kZXJzdGFuZGluZywgQVNQRUVEIEFTVDI2MDAg
aXMgYSBTb0Mgd2hpY2ggdXNlcyBTeW5vcHN5cycKSTNDIElQIGNvcmUsIGFuZCBzZXZlcmFsIGRp
ZmZlcmVudCByZWdpc3RlcnMsIGVzcGVjaWFsbHkgdGhlIHB1bGwtdXAKcmVzaXN0b3IuCklmIHNv
LCBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSB0byBhZGQKYXN0MjYw
MC1pM2MtbWFzdGVyLmMsIGdpdmVuIHRoYXQgYWxsIGN1cnJlbnQgdGhyZWUgeHh4LWkzYy1tYXN0
ZXIuYwpkcml2ZXJzIGluIHRoaXMgZGlyZWN0b3J5IGFyZSBmcm9tIElQIHByb3ZpZGVycyBkaXJl
Y3RseS4KV2hhdCBhYm91dCBtb3ZpbmcgaXQgdW5kZXIgfi9kcml2ZXIvc29jLz8KVGhhbmtzClpl
bmdodSBDaGVuCgpPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCAzOjIy4oCvQU0gSmVyZW15IEtlcnIg
PGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1PiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgYSBu
ZXcgaTNjIGNvbnRyb2xsZXIgZHJpdmVyLCBmb3IgdGhlIEFTUEVFRCBBU1QyNjAwIDEzYwo+IFNv
QyBwZXJpcGhlcmFsLiBUaGlzIGRldmljZSBpcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlIGR3IGkzYyBj
b250cm9sbGVyLCBzbwo+IHdlIGltcGxlbWVudCB0aGlzIGJ5IGFkZGluZyBhIGxpdHRsZSBwbGF0
Zm9ybSBhYnN0cmFjdGlvbiB0byB0aGUgZHcKPiBkcml2ZXIsIGFuZCB0aGVuIGEgcGxhdGZvcm0g
aW1wbGVtZW50YXRpb24gZm9yIGFzdDI2MDAuCj4KPiB2MjogVGhpcyBpcyBhIHJld29yayBmcm9t
IGFuIGVhcmxpZXIgc2VyaWVzIHRoYXQgaW1wbGVtZW50ZWQgdGhpcyBhcwo+IHBhcnQgb2YgdGhl
IGR3IGRyaXZlcjsgSSBoYXZlIGFkb3B0ZWQgQmVuIERvb2tzJyBzdWdnZXN0aW9uIHRvIHNwbGl0
Cj4gaW50byBhIG5ldyBkcml2ZXIgKyBleHBvcnRlZCBob29rcyBmcm9tIHRoZSBkdyBiYXNlLgo+
Cj4gQXMgYWx3YXlzOiBjb21tZW50cywgcXVlcmllcyBldGMuIGFyZSBtb3N0IHdlbGNvbWUuCj4K
PiBDaGVlcnMsCj4KPgo+IEplcmVteQo+Cj4gSmVyZW15IEtlcnIgKDMpOgo+ICAgaTNjOiBkdzog
QWRkIGluZnJhc3RydWN0dXJlIGZvciBwbGF0Zm9ybS1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMK
PiAgIGR0LWJpbmRpbmdzOiBpM2M6IEFkZCBBU1QyNjAwIGkzYyBjb250cm9sbGVyCj4gICBpM2M6
IGFzdDI2MDA6IEFkZCBBU1QyNjAwIHBsYXRmb3JtLXNwZWNpZmljIGRyaXZlcgo+Cj4gIC4uLi9i
aW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwgICAgICB8ICA3MiArKysrKysrKwo+
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwo+
ICBkcml2ZXJzL2kzYy9tYXN0ZXIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMTQgKysK
PiAgZHJpdmVycy9pM2MvbWFzdGVyL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgZHJpdmVycy9pM2MvbWFzdGVyL2FzdDI2MDAtaTNjLW1hc3Rlci5jICAgICAgIHwgMTY5ICsr
KysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jICAg
ICAgICAgICAgfCAgNzYgKysrKy0tLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0
ZXIuaCAgICAgICAgICAgIHwgIDU1ICsrKysrKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDM2MCBpbnNl
cnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTNjL21hc3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIu
Ywo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIu
aAo+Cj4gLS0KPiAyLjM5LjIKPgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
