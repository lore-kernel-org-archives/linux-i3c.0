Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABACCD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3djz4IU6FNPuCxaeWil7YImRhZ4WZDwnszQSpCCtGI=; b=oNjQ/TeQdBwGwl
	8u07/nnIZ82KlMnzc+1JCP+rEaIXeV0OX5EVUwN3czpi07R2IxSztBe6xVMGCrpuvvF0OnXrWEHYm
	Kk6Pv3iHn9TGAwszaXlhc/CHpnT2lLgts6bQeaQ/EeP1+1fEwGYrFhWXuAAH+nzDjZDcikrjRjnVX
	as5j6LGciw2/Ihs5Vd91gyo/ppJaFWvfpk+zCQHs4FfzIv84X3r1x9e4FIjPaCeRs3LkR9JBloNBR
	x3GJryn6fyHBvHNtaZKPKPud9I2AzlJEnkFPIMEQJxrG8k2NKpRX52BSb/Kzaqa23kgkJQAXmHRVM
	qOcYSMF+FbQtAZlkfPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4aX-0000000BDhe-0Tuh;
	Fri, 12 Jun 2026 16:18:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4aV-0000000BDhY-2siq
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:18:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 009A660008
	for <linux-i3c@lists.infradead.org>; Fri, 12 Jun 2026 16:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1711F000E9;
	Fri, 12 Jun 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281110;
	bh=AR5ekJ9M86OzTWafHIX9Ib6ZPgqiuDZ/FXMz1ON+kQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lVU2aToA8Q3KWLjLHdBgZI1q+chgI+xknCA43zgVfxJIkMOpUN37iOewJGrT7gFqk
	 AzLNtr9zXwNKZ/3vHd4LkeNbOLQXz2mIvh3T7RJBJdu4mTjmcK337XPV5i/fYzjWLS
	 R3ecAD3nRHRIDJkAp8gadb3vJHeXQebs3wmiB+uk86r20UNT6E+ndVbuJuMy+chkiE
	 3Bbr8sAPVuC313jWQSGmDZnhf9VQ0OZc1jUeB7nsSTGqkChsthCF26Tf7ftsQI/ref
	 gnQXSUWwvufbzaYQvtRkBeJgOehKX8mMcK8J3sa3F5UJnWVY2tzYLo2+KWpHmbThKL
	 kgOwjokl/DmYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/16] i3c: renesas: Reset the controller on resume
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260612160458.3102106-6-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-6-claudiu.beznea@kernel.org>
Date: Fri, 12 Jun 2026 16:18:30 +0000
Message-Id: <20260612161830.7E1711F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtDcml0aWNhbF0gTWlzc2luZyBoYXJkd2FyZSBjYW5jZWxsYXRpb24gb24gdHJhbnNmZXIgdGlt
ZW91dCBjYXVzZXMgdXNlLWFmdGVyLWZyZWUgYW5kIG1lbW9yeSBjb3JydXB0aW9uLgotIFtIaWdo
XSBUaGUgZHJpdmVyIGlnbm9yZXMgdHJhbnNmZXIgdGltZW91dHMgYW5kIGVycm9ycywgc2lsZW50
bHkgcmVwb3J0aW5nIHN1Y2Nlc3MuCi0tCgpjb21taXQgMDYxNDI0OThjYjkxNjRmMDg0ZGNhOTI0
YmYyNjI1MTM4MTIxYTcwNQpBdXRob3I6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT4KCmkzYzogcmVuZXNhczogUmVzZXQgdGhlIGNvbnRyb2xsZXIgb24g
cmVzdW1lCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHJlbmVzYXNfaTNjX3Jlc2V0KCkgdG8gdXNlIHJl
YWRfcG9sbF90aW1lb3V0X2F0b21pYygpCnNpbmNlIHRoZSByZXN1bWUgY2FsbGJhY2sgcnVucyBp
biB0aGUgbm9pcnEgcGhhc2UuIEl0IGFsc28gcmVzZXRzIHRoZQpjb250cm9sbGVyIG9uIHJlc3Vt
ZSB0byBmb2xsb3cgdGhlIHByb2JlIHNlcXVlbmNlIGFuZCBhdm9pZCBvcmRlcmluZwpyZWxhdGVk
IGZhaWx1cmVzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IGluZGV4IDRiODFjMzJiMWZk
ZWMuLjY3YjlhMzEzMDBkMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVz
YXMtaTNjLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwpbIC4uLiBd
Cj4gQEAgLTE1MDQsNiArMTUwOCw4IEBAIHN0YXRpYyBpbnQgcmVuZXNhc19pM2NfcmVzdW1lX25v
aXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4gK2Vycl9jbGtz
X2Rpc2FibGU6Cj4gKwljbGtfYnVsa19kaXNhYmxlKGkzYy0+bnVtX2Nsa3MsIGkzYy0+Y2xrcyk7
Cj4gIGVycl9wcmVzZXRuOgo+ICAJcmVzZXRfY29udHJvbF9hc3NlcnQoaTNjLT5wcmVzZXRuKTsK
PiAgZXJyX3RyZXNldG46CgpbU2V2ZXJpdHk6IENyaXRpY2FsXQpUaGlzIGlzIGEgcHJlLWV4aXN0
aW5nIGlzc3VlLCBidXQgZG9lcyB0aGUgZHJpdmVyIGhhdmUgYSBzdHJ1Y3R1cmFsIGZsYXcKd2l0
aCB0cmFuc2ZlciB0aW1lb3V0cyBjYXVzaW5nIG1lbW9yeSBjb3JydXB0aW9uPwoKV2hlbiBhIHRy
YW5zZmVyIHRpbWVzIG91dCBpbiByZW5lc2FzX2kzY193YWl0X3hmZXIoKSwgdGhlIHRyYW5zZmVy
IGlzCmRlcXVldWVkIGFuZCBjYW4gYmUgZnJlZWQ6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNh
cy1pM2MuYzpyZW5lc2FzX2kzY193YWl0X3hmZXIoKSB7CiAgICAuLi4KICAgIGlmICghdGltZV9s
ZWZ0KQogICAgICAgIHJlbmVzYXNfaTNjX2RlcXVldWVfeGZlcihpM2MsIHhmZXIpOwogICAgLi4u
Cn0KCkhvd2V2ZXIsIHRoZSBhY3RpdmUgaGFyZHdhcmUgdHJhbnNhY3Rpb24gaXMgbmV2ZXIgYWJv
cnRlZC4gSWYgdGhlIHRhcmdldApldmVudHVhbGx5IGNvbXBsZXRlcyB0aGUgdHJhbnNhY3Rpb24s
IHRoZSBoYXJkd2FyZSB3aWxsIHdyaXRlIGEgcmVzcG9uc2UKZGVzY3JpcHRvciB0byBOUlNQUVAu
CgpXaGVuIGEgc3Vic2VxdWVudCB0cmFuc2ZlciBpcyBpbml0aWF0ZWQsIHRoZSBkcml2ZXIgcmUt
ZW5hYmxlcyB0aGUgaW50ZXJydXB0LAphbmQgdGhlIElTUiB3aWxsIGZpcmUsIHBpY2tpbmcgdXAg
dGhlIG5ldyB0cmFuc2ZlcjoKCmRyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOnJlbmVz
YXNfaTNjX3Jlc3BfaXNyKCkgewogICAgLi4uCiAgICB4ZmVyID0gaTNjLT54ZmVycXVldWUuY3Vy
OwogICAgLi4uCiAgICBkYXRhX2xlbiA9IE5SU1BRUF9EQVRBX0xFTihyZXNwX2Rlc2NyaXB0b3Ip
OwogICAgLi4uCiAgICBpM2NfcmVhZGxfZmlmbyhpM2MtPnJlZ3MgKyBOVERUQlAwLCBjbWQtPnJ4
X2J1ZiwgYnl0ZXNfcmVtYWluaW5nKTsKICAgIC4uLgp9CgpXaWxsIHRoZSBJU1IgYmxpbmRseSBy
ZWFkIHRoZSBzdGFsZSBkYXRhIGZyb20gdGhlIG9sZCBjb21wbGV0ZWQgaGFyZHdhcmUKdHJhbnNh
Y3Rpb24gaW50byB0aGUgbmV3IHRyYW5zZmVyJ3MgcnhfYnVmPwoKSWYgdGhlIG9sZCB0cmFuc2Zl
cidzIGxlbmd0aCBleGNlZWRzIHRoZSBuZXcgdHJhbnNmZXIncyBidWZmZXIgc2l6ZSwgY291bGRu
J3QKdGhpcyBvdmVyZmxvdyB0aGUgYnVmZmVyIGFuZCBjYXVzZSBtZW1vcnkgY29ycnVwdGlvbj8K
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMg
dGhlIGRyaXZlciBpZ25vcmUgdHJhbnNmZXIgdGltZW91dHMKYW5kIGVycm9ycywgc2lsZW50bHkg
cmVwb3J0aW5nIHN1Y2Nlc3M/CgpJbiByZW5lc2FzX2kzY19pM2NfeGZlcnMoKSwgdGhlIGZ1bmN0
aW9uIGlnbm9yZXMgdHJhbnNmZXIgdGltZW91dHMgYW5kIGVycm9ycywKcmV0dXJuaW5nIDAgdW5j
b25kaXRpb25hbGx5OgoKZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmM6cmVuZXNhc19p
M2NfaTNjX3hmZXJzKCkgewogICAgLi4uCiAgICBpZiAoeGZlcl9mYWlsZWQpCiAgICAgICAgcmVu
ZXNhc19pM2NfaXJxc19tYXNrX2FuZF9jbGVhcihpM2MpOwoKICAgIHJldHVybiAwOwp9CgpTaW1p
bGFybHksIGluIHJlbmVzYXNfaTNjX2kyY194ZmVycygpOgoKZHJpdmVycy9pM2MvbWFzdGVyL3Jl
bmVzYXMtaTNjLmM6cmVuZXNhc19pM2NfaTJjX3hmZXJzKCkgewogICAgLi4uCiAgICBpZiAoeGZl
cl9mYWlsZWQpCiAgICAgICAgcmVuZXNhc19pM2NfaXJxc19tYXNrX2FuZF9jbGVhcihpM2MpOwoK
ICAgIHJldHVybiBjbWQtPmVycjsKfQoKU2luY2UgY21kLT5lcnIgaXMgb25seSB1cGRhdGVkIHRv
IGEgbmVnYXRpdmUgY29kZSBieSB0aGUgSVNSIHVwb24gYW4gZXhwbGljaXQKTkFDSywgaXQgcmVt
YWlucyAwIG9uIHRpbWVvdXQuIERvZXNuJ3QgdGhpcyBmYWxzZWx5IGNsYWltIHRoYXQgdGhlIG1l
c3NhZ2UKd2FzIHN1Y2Nlc3NmdWxseSBkZWxpdmVyZWQgdG8gdGhlIGNvcmUgSTNDIHN1YnN5c3Rl
bT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA2MTIxNjA0NTguMzEwMjEwNi0xLWNsYXVkaXUuYmV6bmVhQGtlcm5lbC5vcmc/cGFy
dD01CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
