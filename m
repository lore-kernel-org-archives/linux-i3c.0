Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A2BC44501
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO2qzU4TTEdqMrhDT3chrNgmPcyO77oYaO8/XglsOAg=; b=etOIB90kQqgMC3
	tgl+l/1UVX8Kk8oJNqQCLoq4viBrr9i7YJ9cOWSF/X87KeTQx6b2IR4WPZoJiwsBUNY58dM9uIy6X
	iEb9m4hycR9cORLIq8YQZ5nkONxn5mgujuRsLxC9q/n5kSCxU4X8cmABeWs6QxlM5/txvyBJM1SkY
	0AtCu9GhvKV6RvJvVgnCrjoW9rCEbzVw/os5JgsEYcKVVUGRJnCtg1ZSOxpqlm3sWD9PGOPXO6PZZ
	itQRx1MP96CPSe+kEyOOaapIe9lApcVMkDzOIe5BjUDmEnoAOHRZD1QVTdGRl7vuHWajqff0/rxKL
	KKmrgfd2BkM9JVYQtbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHRj-00000009ZNb-2wWn;
	Mon, 13 Jul 2026 14:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHRh-00000009ZN6-2tHe
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 14:15:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4F97600D8;
	Mon, 13 Jul 2026 14:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1476F1F000E9;
	Mon, 13 Jul 2026 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783952144;
	bh=GCshzDJgL5qpdTiAnMPnZDIbbhRokhokCmpnjVtCmFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVQepfn+IOu1KJiafUk25nMy4il8ssNZv4M78hkBt9XzxNVv436ZddDB891KaUNxL
	 Iw9v6Um83GFS0DJJZNFYY/3Lc+8KuKXng/gglu+99BjYXHH9gUVpc/Ous7Jw/3avO7
	 Myrl7VzPpL61uze0BTdeRZ7D5QJwRt7yKlCy4Yu1RN21Lvl1h9pKQUwe4o4fHCEQPB
	 19KLFdln/bU0Mvw82/S5p/IIGdeEvy/0Df+wrLVjXCDcp0iysIg4mK4SlMft0ubgJy
	 XEUA5VprlY6DODypLe3I4QqM4j6o/63FQW1lmiFXO0M8YIWnUeHfjTdI1G8eD3s9y5
	 6wN+cN58wbp9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/17] i3c: renesas: Organize structures to avoid
 unnecessary padding
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260713130545.568657-15-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-15-claudiu.beznea+renesas@tuxon.dev>
Date: Mon, 13 Jul 2026 14:15:43 +0000
Message-Id: <20260713141544.1476F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBhdGNoIGlt
cGxpY2l0bHkgYWRkcyBhIG5ldywgY29tcGxldGVseSB1bnVzZWQgZmllbGQgYGJvb2wgcmVzdW1p
bmc7YCB0byBgc3RydWN0IHJlbmVzYXNfaTNjYCB3aGljaCBhbHNvIGludHJvZHVjZXMgdW5uZWNl
c3NhcnkgcGFkZGluZy4KLS0KCi0tLSBQYXRjaCBbMTRdOiBbUEFUQ0ggdjUgMTQvMTddIGkzYzog
cmVuZXNhczogT3JnYW5pemUgc3RydWN0dXJlcyB0byBhdm9pZCB1bm5lY2Vzc2FyeSBwYWRkaW5n
IC0tLQpjb21taXQgYzMzZjY1Y2RkYWU5MWZiZjE3M2M2MDRlMzY5ODEwM2M1OWRhOTQ2NgpBdXRo
b3I6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KaTNj
OiByZW5lc2FzOiBPcmdhbml6ZSBzdHJ1Y3R1cmVzIHRvIGF2b2lkIHVubmVjZXNzYXJ5IHBhZGRp
bmcKClRoaXMgY29tbWl0IHJlb3JkZXJzIHRoZSBtZW1iZXJzIG9mIHRoZSByZW5lc2FzX2kzY19j
bWQgYW5kIHJlbmVzYXNfaTNjCnN0cnVjdHVyZXMuIFRoZSBzdGF0ZWQgZ29hbCBpcyB0byByZWR1
Y2UgcGFkZGluZyBhbmQgaW1wcm92ZSBtZW1vcnkgbGF5b3V0LgoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNh
cy1pM2MuYwo+IGluZGV4IDJjZmY3YzZhZTM2OTIuLmE1NGMyMGVmNWY2ZWEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvcmVuZXNhcy1pM2MuYwoKWyAuLi4gXQoKPiBAQCAtMjUzLDIxICsyNTMsMjIgQEAgc3Ry
dWN0IHJlbmVzYXNfaTNjX3hmZXJxdWV1ZSB7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3QgcmVuZXNhc19p
M2Mgewo+ICsJdm9pZCBfX2lvbWVtICpyZWdzOwo+ICsJc3RydWN0IGNsa19idWxrX2RhdGEgKmNs
a3M7Cj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcHJlc2V0bjsKPiArCXN0cnVjdCByZXNldF9j
b250cm9sICp0cmVzZXRuOwo+ICsJc3RydWN0IHJlbmVzYXNfaTNjX3hmZXJxdWV1ZSB4ZmVycXVl
dWU7Cj4gIAlzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyIGJhc2U7Cj4gKwl1OCBhZGRyc1tS
RU5FU0FTX0kzQ19NQVhfREVWU107Cj4gKwl1bnNpZ25lZCBsb25nIHJhdGU7Cj4gIAllbnVtIGkz
Y19pbnRlcm5hbF9zdGF0ZSBpbnRlcm5hbF9zdGF0ZTsKPiAtCXUxNiBtYXhkZXZzOwo+ICsJYm9v
bCByZXN1bWluZzsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoZSBhZGRpdGlvbiBvZiB0aGlz
IGJvb2xlYW4gZmllbGQgY29udHJhZGljdCB0aGUgY29tbWl0IG1lc3NhZ2U/CgpUaGUgY29tbWl0
IG1lc3NhZ2Ugc3RhdGVzIHRoZSBnb2FsIGlzIHRvIHJlZHVjZSBwYWRkaW5nIGFuZCBpbXByb3Zl
IG1lbW9yeSAKbGF5b3V0LCBidXQgdGhpcyBhZGRzIGEgY29tcGxldGVseSB1bnVzZWQgZmllbGQs
IHJlc3VtaW5nLCB0byBzdHJ1Y3QgCnJlbmVzYXNfaTNjIHRoYXQgd2FzIG5vdCBwcmVzZW50IGJl
Zm9yZS4gQWRkaW5nIHRoaXMgMS1ieXRlIGZpZWxkIGJldHdlZW4gYSAKNC1ieXRlIGVudW0gKGlu
dGVybmFsX3N0YXRlKSBhbmQgYSA0LWJ5dGUgdTMyIChmcmVlX3BvcykgYXBwZWFycyB0byAKaW50
cm9kdWNlIDMgYnl0ZXMgb2YgaW50ZXJuYWwgcGFkZGluZyB0byBzYXRpc2Z5IGFsaWdubWVudCBy
ZXF1aXJlbWVudHMuCgpJcyBpdCBwb3NzaWJsZSB0aGlzIGZpZWxkIHdhcyBhY2NpZGVudGFsbHkg
aW5jbHVkZWQgZnJvbSBhbm90aGVyIHBhdGNoPwoKPiAgCXUzMiBmcmVlX3BvczsKPiAgCXUzMiBk
eW5fYWRkcjsKPiAgCXUzMiBpMmNfU1REQlI7Cj4gIAl1MzIgaTNjX1NUREJSOwoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMzEz
MDU0NS41Njg2NTctMS1jbGF1ZGl1LmJlem5lYStyZW5lc2FzQHR1eG9uLmRldj9wYXJ0PTE0Cgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
