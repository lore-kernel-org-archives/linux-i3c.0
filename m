Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67BFCD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+QQM3ni6oyEK9YFyaGgY+HG/9T2fFMI1FKFJge1X8M=; b=rrmcsboyKct4Z1
	3s3YDmBTnAPj9IsnDOl1DjTYV225Wp3Hc1hvvOGa4aiCxpTUCByPBW7WuC++2dbdHqF2z5Inz8g4v
	ugyQ/gYOm9MAm1BcVlWs8h29yVf1BuSZsv1DH7jcHOnrK0LEDrKAnjC4dtIw8EaEmh//WtlQJsBjS
	28rbvYTXla6n/mLy4uE9Mb1QY+TaUUk2R540lk1PRg/x93FLcCKzgKdVgt07ZKzGqzu0xyIDTIqJ1
	pILnewZq8isF4dkVfWqjdA+b0uCbBxfOU7yb97XJUUVm8Nv5g7IDiy626CzQa+IxQRSJPO2J8BBuz
	CNYxacjd3f6hh16zalFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgb4-00000004MTA-2Kcu;
	Mon, 08 Jun 2026 20:29:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgb3-00000004MT1-34mt
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:29:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32DD56001D;
	Mon,  8 Jun 2026 20:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8361F00893;
	Mon,  8 Jun 2026 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780950560;
	bh=dtxJt8gWGQVYNjCwyqR6W6og8c0KFrWCTYD2Jo2y/XY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j14Q20BYEaPqV9BiW3AIQZB7CosKrtfVa0YQIs6bPd+oaz6k1doXeGW4ROVRiOEaO
	 MZjTwLSVJ+XeAR3kCTP2ZhLxqCTDXdm+RNA40dfAbgSZZLio3EX1GB0IyKYsnrw5vV
	 rACbo08emdMuM/SYIFUnhXUEvJj9109IX6IsR/ooSdnqbnFPSDHVMeQ4So0VQh5bc7
	 LrX+KeuG1IZ6jUNxheHjrO0A3AeOLWxR71erHTxZpmcTdSNi4leR6LZE4Lv8KQrfiR
	 /cJsc6Ij6cwyi3LL58PODV2j0SEtNFp7tT3UAfIUziqTtiCII114TO4Gk0c5zUdqYx
	 auhFPmb2R9EhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/17] i3c: renesas: Reset the controller on resume
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260608201543.804902-6-claudiu.beznea@kernel.org>
References: <20260608201543.804902-6-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:29:20 +0000
Message-Id: <20260608202920.AD8361F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBIYXJkd2FyZSByZXNldHMgKGB0cmVzZXRuYCBhbmQgYHByZXNldG5gKSBhcmUgZGVh
c3NlcnRlZCBiZWZvcmUgY2xvY2tzIGFyZSBlbmFibGVkIGR1cmluZyByZXN1bWUsIHZpb2xhdGlu
ZyBzdGFuZGFyZCBwb3dlci1vbiBzZXF1ZW5jZXMgYW5kIGNvbnRyYWRpY3RpbmcgdGhlIHByb2Jl
IGxvZ2ljLgotLQoKY29tbWl0IGU2YzI1ZTM5YWIxMjNkMDUwNWRjZTZiZDRkNTg4ZTk3M2MwODNh
YjgKQXV0aG9yOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5j
b20+CgppM2M6IHJlbmVzYXM6IFJlc2V0IHRoZSBjb250cm9sbGVyIG9uIHJlc3VtZQoKVGhpcyBj
b21taXQgcmVvcmRlcnMgdGhlIHNvZnR3YXJlIHJlc2V0IChyZW5lc2FzX2kzY19yZXNldCkgZHVy
aW5nCnJlc3VtZSB0byBoYXBwZW4gYWZ0ZXIgdGhlIGNsb2NrcyBhcmUgZW5hYmxlZC4gSXQgYWxz
byB1cGRhdGVzIHRoZQpyZXNldCBmdW5jdGlvbiB0byB1c2UgYW4gYXRvbWljIHBvbGxpbmcgbWVj
aGFuaXNtIHNpbmNlIHRoZSByZXN1bWUgY2FsbGJhY2sKcnVucyBkdXJpbmcgdGhlIG5vaXJxIHBo
YXNlLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMKPiBpbmRleCA3NmE0ODMxMDk4Yzk0Li43ZWYzMTdiMmJhMzlhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
L3JlbmVzYXMtaTNjLmMKWyAuLi4gXQo+IEBAIC0xNDgzLDYgKzE0ODMsMTAgQEAgc3RhdGljIGlu
dCByZW5lc2FzX2kzY19yZXN1bWVfbm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJaWYgKHJl
dCkKPiAgCQlnb3RvIGVycl9wcmVzZXRuOwo+ICAKPiArCXJldCA9IHJlbmVzYXNfaTNjX3Jlc2V0
KGkzYyk7Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZXJyX2Nsa3NfZGlzYWJsZTsKPiArCgpbU2V2
ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCB0aGUgY29tbWl0
IG1lc3NhZ2Ugc3RhdGVzIGl0IGFpbXMgdG8KImZvbGxvdyB0aGUgc2FtZSBzZXF1ZW5jZSBhcyBp
biBwcm9iZSIsIHdoZXJlIGNsb2NrcyBhcmUgZW5hYmxlZCBiZWZvcmUKcmVzZXRzIGFyZSBkZWFz
c2VydGVkLgoKV2hpbGUgdGhpcyBwYXRjaCBtb3ZlcyB0aGUgc29mdHdhcmUgcmVzZXQgdG8gaGFw
cGVuIGFmdGVyIHRoZSBjbG9ja3MgYXJlCmVuYWJsZWQsIHRoZSBoYXJkd2FyZSByZXNldHMgKHRy
ZXNldG4gYW5kIHByZXNldG4pIGFyZSBzdGlsbCBkZWFzc2VydGVkCmJlZm9yZSBjbGtfYnVsa19l
bmFibGUoKSBpcyBjYWxsZWQgaW4gcmVuZXNhc19pM2NfcmVzdW1lX25vaXJxKCk6Cgpkcml2ZXJz
L2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzpyZW5lc2FzX2kzY19yZXN1bWVfbm9pcnEoKSB7CiAg
ICAuLi4KCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoaTNjLT50cmVzZXRuKTsKCWlmIChy
ZXQpCgkJcmV0dXJuIHJldDsKCglyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGkzYy0+cHJl
c2V0bik7CglpZiAocmV0KQoJCWdvdG8gZXJyX3RyZXNldG47CgoJcmV0ID0gY2xrX2J1bGtfZW5h
YmxlKGkzYy0+bnVtX2Nsa3MsIGkzYy0+Y2xrcyk7CiAgICAuLi4KfQoKU2hvdWxkIHRoZSByZXNl
dF9jb250cm9sX2RlYXNzZXJ0KCkgY2FsbHMgYWxzbyBiZSBtb3ZlZCB0byBoYXBwZW4gYWZ0ZXIK
Y2xrX2J1bGtfZW5hYmxlKCkgdG8gZnVsbHkgYWxpZ24gd2l0aCB0aGUgcHJvYmUgc2VxdWVuY2Ug
YW5kIGF2b2lkIHJlbGVhc2luZwpzeW5jaHJvbm91cyBoYXJkd2FyZSByZXNldHMgd2hpbGUgdGhl
IHBlcmlwaGVyYWwgY2xvY2sgaXMgZGlzYWJsZWQ/Cgo+ICAJLyogUmUtc3RvcmUgSTNDIHJlZ2lz
dGVycyB2YWx1ZS4gKi8KPiAgCXJlbmVzYXNfd3JpdGVsKGkzYy0+cmVncywgU1REQlIsIGkzYy0+
aTNjX1NUREJSKTsKPiAgCXJlbmVzYXNfd3JpdGVsKGkzYy0+cmVncywgRVhUQlIsIGkzYy0+ZXh0
YnIpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDYwODIwMTU0My44MDQ5MDItMS1jbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnP3Bh
cnQ9NQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
