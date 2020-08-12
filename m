Return-Path: <SRS0=SnxP=BW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFACCC433E0
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 15:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CFA207F7
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 15:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Caf25ait"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CFA207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=veLJvU4Bb8GPCOku8qqmwiCxNH05TigEH4z01s1lD5M=; b=Caf25aitkbEge5X/8HNDzyqW1
	uJ+3wQQ8jskmiqlGW0AMIMwqWqat5NzSOIH/vZdHdguS6OLCy82xyQeNdfKZrROvCDN4WKE//Nunx
	ETQGoiFNBmIRvDoRhuUHVn4U01OjSoZbbghpiCpG6BUZCd6+2Rd8dE5bdj0DYVP8YhLB4c+sLsff5
	aO8sHq0sRP6ZN8s17z6w9muTGqvUsdGS+T5wqSFKq/ebzdS8yzYI6qjZ9lXvVozhPVGFzNp9+IsnA
	SGsHP8juTxYjelTKbxa8GjCsgMD588vVrEHFtaiEIGNUK5H7XdxNkRwTxVY44922dcxaPj19d9xdu
	OUiQMKnpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5sW1-0000jo-VG
	for linux-i3c@archiver.kernel.org; Wed, 12 Aug 2020 15:18:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sW0-0000jS-82
 for linux-i3c@lists.infradead.org; Wed, 12 Aug 2020 15:18:09 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1D0541BF20B;
 Wed, 12 Aug 2020 15:18:03 +0000 (UTC)
Date: Wed, 12 Aug 2020 17:18:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20200812171802.295b08d8@xps13>
In-Reply-To: <20200812141312.3331-3-miquel.raynal@bootlin.com>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
 <20200812141312.3331-3-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_111808_480645_31187649 
X-CRM114-Status: GOOD (  15.64  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 linux-kernel@vger.kernel.org, Conor Culhane <conor.culhane@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsIFJhamVldiwKCj4gK3N0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2li
aShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiArCQkJCSAgICAgc3RydWN0IGkzY19k
ZXZfZGVzYyAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3Qgc3ZjX2kzY19pMmNfZGV2X2RhdGEgKmRhdGEg
PSBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YShkZXYpOwo+ICsJc3RydWN0IGkzY19pYmlfc2xvdCAq
c2xvdDsKPiArCXVuc2lnbmVkIGludCBjb3VudDsKPiArCXUzMiBtZGF0YWN0cmw7Cj4gKwlpbnQg
cmV0ID0gMDsKPiArCXU4ICpidWY7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZtYXN0ZXItPmliaS5sb2Nr
KTsKPiArCj4gKwlzbG90ID0gaTNjX2dlbmVyaWNfaWJpX2dldF9mcmVlX3Nsb3QoZGF0YS0+aWJp
X3Bvb2wpOwo+ICsJaWYgKCFzbG90KSB7Cj4gKwkJcmV0ID0gLUVOT1NQQzsKPiArCQlnb3RvIHVu
bG9jazsKPiArCX0KPiArCj4gKwlzbG90LT5sZW4gPSAwOwo+ICsJYnVmID0gc2xvdC0+ZGF0YTsK
PiArCXdoaWxlIChyZWFkbChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMpICYgU1ZDX0kz
Q19NSU5UX1JYUEVORCkgewo+ICsJCW1kYXRhY3RybCA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNW
Q19JM0NfTURBVEFDVFJMKTsKPiArCQljb3VudCA9IFNWQ19JM0NfTURBVEFDVFJMX1JYQ09VTlQo
bWRhdGFjdHJsKTsKPiArCQlyZWFkc2wobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCLCBi
dWYsIGNvdW50KTsKCkFmdGVyIGRpc2N1c3Npbmcgd2l0aCBCb3JpcywgSSBoYXZlIGEgcXVlc3Rp
b24gYWJvdXQgdGhlIGRlc2lnbjogaXMKdGhlcmUgYSB3YXkgdG8gZGlmZmVyZW50aWF0ZSwgZnJv
bSBhIHNvZnR3YXJlIHBvaW50IG9mIHZpZXcsIGZyb20gdGhlCmRhdGEgY29taW5nIGFzICJJQkki
IGFuZCAicmVndWxhciBkYXRhIj8KCkxldCdzIHNheSB0aGUgbWFzdGVyIGluaXRpYXRlcyBhIHJl
YWQuClRoZSBtb21lbnQgYWZ0ZXIsIGFuIElCSSBpcyB0cmlnZ2VyZWQuClRoZSBoYW5sZGVfaWJp
KCkgaGVscGVyIGlzIGNhbGxlZCB0byByZWFkIHRoZSBJQkkgcGF5bG9hZC4KV2hpbGUgdGhlIElC
SSBpbnRlcnJ1cHRlZCB0aGUgcmVhZCBvcGVyYXRpb24sIGl0IGFsc28gaW50ZXJydXB0ZWQgdGhl
Cm1hc3RlciBkZXF1ZXVpbmcgcHJvY2VzcyBvZiB0aGUgYnl0ZXMgYWxyZWFkeSBpbiB0aGUgRklG
Ty4gRnJvbSBhCnNvZnR3YXJlIHBlcnNwZWN0aXZlLCB3ZSBtaWdodCBlbmQgdXAgcmVhZGluZyBh
ICJyZWd1bGFyIGJ5dGUiIGZyb20gdGhlCmhhbmRsZV9pYmkoKSBoZWxwZXIgZXhwZWN0aW5nIGFu
ICJJQkkgYnl0ZSIuCgpJcyB0aGVyZSBzb21lIGtpbmQgb2YgZG91YmxlIHF1ZXVlIGZlYXR1cmUg
d2hpY2ggSSBtaXNzZWQ/IE9yIHBlcmhhcHMgYQp3YXkgdG8gZGlzY3JpbWluYXRlIHRoZSBvcmln
aW4gb2YgdGhlIGRhdGE/Cgo+ICsJCXNsb3QtPmxlbiArPSBjb3VudDsKPiArCQlidWYgKz0gY291
bnQ7Cj4gKwl9Cj4gKwo+ICsJaTNjX21hc3Rlcl9xdWV1ZV9pYmkoZGV2LCBzbG90KTsKPiArCj4g
K3VubG9jazoKPiArCXNwaW5fdW5sb2NrKCZtYXN0ZXItPmliaS5sb2NrKTsKPiArCXN2Y19pM2Nf
bWFzdGVyX2VtaXRfc3RvcChtYXN0ZXIpOwo+ICsJc3ZjX2kzY19tYXN0ZXJfZmx1c2hfZmlmbyht
YXN0ZXIpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHN2Y19p
M2NfbWFzdGVyX2Fja19pYmkoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gKwkJCQkg
ICBib29sIG1hbmRhdG9yeV9ieXRlKQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgaWJpX2Fja19uYWNr
Owo+ICsKPiArCWliaV9hY2tfbmFjayA9IFNWQ19JM0NfTUNUUkxfUkVRVUVTVF9JQklfQUNLTkFD
SzsKPiArCWlmIChtYW5kYXRvcnlfYnl0ZSkKPiArCQlpYmlfYWNrX25hY2sgfD0gU1ZDX0kzQ19N
Q1RSTF9JQklSRVNQX0FDS19XSVRIX0JZVEU7Cj4gKwllbHNlCj4gKwkJaWJpX2Fja19uYWNrIHw9
IFNWQ19JM0NfTUNUUkxfSUJJUkVTUF9BQ0tfV0lUSE9VVF9CWVRFOwo+ICsKPiArCXdyaXRlbChp
YmlfYWNrX25hY2ssIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwpOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9uYWNrX2liaShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIg
Km1hc3RlcikKPiArewo+ICsJd3JpdGVsKFNWQ19JM0NfTUNUUkxfUkVRVUVTVF9JQklfQUNLTkFD
SyB8Cj4gKwkgICAgICAgU1ZDX0kzQ19NQ1RSTF9JQklSRVNQX05BQ0ssCj4gKwkgICAgICAgbWFz
dGVyLT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpcnFyZXR1cm5f
dCBzdmNfaTNjX21hc3Rlcl9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gK3sK
PiArCXN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyID0gKHN0cnVjdCBzdmNfaTNjX21hc3Rl
ciAqKWRldl9pZDsKPiArCXUzMiBhY3RpdmUgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBTVkNfSTND
X01JTlRNQVNLRUQpOwo+ICsJdTMyIHN0YXR1cyA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19J
M0NfTVNUQVRVUyk7Cj4gKwl1bnNpZ25lZCBpbnQgaWJpdHlwZSA9IFNWQ19JM0NfTVNUQVRVU19J
QklUWVBFKHN0YXR1cyk7Cj4gKwl1bnNpZ25lZCBpbnQgaWJpYWRkciA9IFNWQ19JM0NfTVNUQVRV
U19JQklBRERSKHN0YXR1cyk7Cj4gKwlzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXY7Cj4gKwlib29s
IHJkYXRhOwo+ICsKPiArCWlmIChhY3RpdmUgJiBTVkNfSTNDX01JTlRfU0xWU1RBUlQpIHsKPiAr
CQl3cml0ZWwoU1ZDX0kzQ19NSU5UX1NMVlNUQVJULCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01T
VEFUVVMpOwo+ICsJCXdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkkgfAo+ICsJ
CSAgICAgICBTVkNfSTNDX01DVFJMX0lCSVJFU1BfTUFOVUFMLAo+ICsJCSAgICAgICBtYXN0ZXIt
PnJlZ3MgKyBTVkNfSTNDX01DVFJMKTsKPiArCQlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gKwl9Cj4g
Kwo+ICsJaWYgKCEoYWN0aXZlICYgU1ZDX0kzQ19NSU5UX0lCSVdPTikpCj4gKwkJcmV0dXJuIElS
UV9OT05FOwo+ICsKPiArCXdyaXRlbChTVkNfSTNDX01JTlRfSUJJV09OLCBtYXN0ZXItPnJlZ3Mg
KyBTVkNfSTNDX01TVEFUVVMpOwo+ICsKPiArCXN3aXRjaCAoaWJpdHlwZSkgewo+ICsJY2FzZSBT
VkNfSTNDX01TVEFUVVNfSUJJVFlQRV9JQkk6Cj4gKwkJZGV2ID0gc3ZjX2kzY19tYXN0ZXJfZGV2
X2Zyb21fYWRkcihtYXN0ZXIsIGliaWFkZHIpOwo+ICsJCWlmIChXQVJOX09OKCFkZXYpKSB7Cj4g
KwkJCXN2Y19pM2NfbWFzdGVyX25hY2tfaWJpKG1hc3Rlcik7Cj4gKwkJCWJyZWFrOwo+ICsJCX0K
PiArCj4gKwkJcmRhdGEgPSBkZXYtPmluZm8uYmNyICYgSTNDX0JDUl9JQklfUEFZTE9BRDsKPiAr
CQlzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKG1hc3RlciwgcmRhdGEpOwo+ICsJCWlmIChyZGF0YSkg
ewo+ICsJCQlzdmNfaTNjX21hc3Rlcl9kaXNhYmxlX2ludGVycnVwdHMobWFzdGVyKTsKPiArCQkJ
cmV0dXJuIElSUV9XQUtFX1RIUkVBRDsKPiArCQl9Cj4gKwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBT
VkNfSTNDX01TVEFUVVNfSUJJVFlQRV9NQVNURVJfUkVRVUVTVDoKPiArCQlzdmNfaTNjX21hc3Rl
cl9uYWNrX2liaShtYXN0ZXIpOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBTVkNfSTNDX01TVEFUVVNf
SUJJVFlQRV9IT1RfSk9JTjoKPiArCQlzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKG1hc3RlciwgZmFs
c2UpOwo+ICsJCXF1ZXVlX3dvcmsobWFzdGVyLT5iYXNlLndxLCAmbWFzdGVyLT5oal93b3JrKTsK
PiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJcmV0dXJuIElSUV9OT05FOwo+ICsJfQo+ICsK
PiArCXJldHVybiBJUlFfSEFORExFRDsKPiArfQo+ICsKPiArc3RhdGljIGlycXJldHVybl90IHN2
Y19pM2NfbWFzdGVyX3RocmVhZGVkX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ICt7
Cj4gKwlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IChzdHJ1Y3Qgc3ZjX2kzY19tYXN0
ZXIgKilkZXZfaWQ7Cj4gKwl1MzIgc3RhdHVzID0gcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kz
Q19NU1RBVFVTKTsKPiArCXVuc2lnbmVkIGludCBpYmlhZGRyID0gU1ZDX0kzQ19NU1RBVFVTX0lC
SUFERFIoc3RhdHVzKTsKPiArCXN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldjsKPiArCj4gKwlkZXYg
PSBzdmNfaTNjX21hc3Rlcl9kZXZfZnJvbV9hZGRyKG1hc3RlciwgaWJpYWRkcik7Cj4gKwlpZiAo
V0FSTl9PTighZGV2KSkgewo+ICsJCXN2Y19pM2NfbWFzdGVyX2VtaXRfc3RvcChtYXN0ZXIpOwo+
ICsJCXN2Y19pM2NfbWFzdGVyX2ZsdXNoX2ZpZm8obWFzdGVyKTsKPiArCQlyZXR1cm4gSVJRX0hB
TkRMRUQ7Cj4gKwl9Cj4gKwo+ICsJc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaShtYXN0ZXIsIGRl
dik7Cj4gKwlzdmNfaTNjX21hc3Rlcl9lbmFibGVfaW50ZXJydXB0cyhtYXN0ZXIsCj4gKwkJCQkJ
IFNWQ19JM0NfTUlOVF9TTFZTVEFSVCB8Cj4gKwkJCQkJIFNWQ19JM0NfTUlOVF9JQklXT04pOwo+
ICsKPiArCXJldHVybiBJUlFfSEFORExFRDsKPiArfQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
