Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82644606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3R6ThL4J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U46dkGLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RULa/tQj8DKpst63BzF7238w4r3dmt9tzRVx90K13c4=; b=3R6ThL4JiHFsInxiC1xXwT19D2
	i/db0hVfi5RR2I5rN9MDFkvRj12pDO4H3lZhZqi11EWNgNwuXmAIxXZq0nDXZ7lUJXufpuXqAxGEU
	AO5hU4tuRv7O164FVx0mru/RO8gpBUD/hOBdVo99rMAt2yXoq2twlc90WDM2sH4ESv3btrgBLhUSV
	zvEg/0SDr6TxnSRCyEuJiVPFv4BR5Oq4fh12OBD5tIjzaysxoNCeSadu3YdiQsJyP5Z52TlbSNCuH
	gSTNhlWzepNrO86XAuznEp21OV41g+lMtTDTOLxVQOcfkyn6m64ekTOgOwQniiCIaMnCzOEr0haNi
	Kpss0IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyTW-00000005UID-0DJW;
	Wed, 11 Nov 2026 02:54:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyTU-00000005UI4-0XZT
	for linux-i3c@lists.infradead.org;
	Wed, 11 Nov 2026 02:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D1A542296;
	Wed, 11 Nov 2026 02:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA2A1F0093C;
	Wed, 11 Nov 2026 02:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365651;
	bh=rvWTUYdbEHaGLvlmw5KeJhOouS+QjXyt4I/GAmot5NQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U46dkGLYJPFs3rOXgQaVU6cPRyFIe5NZxEuEF/20t/4n6tcExF7qImgpO5T3SNyK/
	 h7DHvedml6Ko5io5wRlCJ/ENFbbMQqL7cdQv1466mgIds0NMdSjPj3a3IKZd9qIQF9
	 KCHeqJyxMqTN0QKTOkG9v4fgXkcqKpdavva7cpYsjBGNfMPPSUJT1yFLwaXgUP9m49
	 AhjsZAlxTltQfFhCp6cttpAdW6ukTiBIKZctKmjtdSwNpVN7gDkiR1TAyhMqc6VpCO
	 BAk/K/bGNVR9uWX0JH5duFs+0xYPEG5N6xcCIpf21YHz2qgy2M7rF+WS6ki7WyAfpz
	 BlCIupUyVkIAw==
Message-ID: <sashiko-outbox-208126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
To: "Dineshkumar Parameswaran" <Dineshkumar.Parameswaran@synopsys.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261111021151.58380-1-parame@synopsys.com>
References: <20261101005243.4739-1-parame@synopsys.com>
 <20261111021151.58380-1-parame@synopsys.com>
Date: Wed, 11 Nov 2026 02:54:10 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogbWFzdGVyOiBkdzog
YnJva2VuIEhEUi1ERFIgZGlyZWN0aW9uIGNoZWNrIGluCiAgZHdfaTNjX21hc3Rlcl9pM2NfeGZl
cnMoKQotLQoKY29tbWl0IGU4OThjMzJhZWQwODFjY2VhZTdmNTY3ZjNkYTFjNTBiODI1ZjU1YzYK
QXV0aG9yOiBEaW5lc2hrdW1hciBQYXJhbWVzd2FyYW4gPERpbmVzaGt1bWFyLlBhcmFtZXN3YXJh
bkBzeW5vcHN5cy5jb20+CgppM2M6IG1hc3RlcjogZHctaTNjLW1hc3RlcjogQWRkIEhEUi1ERFIg
c3VwcG9ydCB0byBEZXNpZ253YXJlIENvbnRyb2xsZXIuCgpUaGlzIGNvbW1pdCBhZGRzIEhEUi1E
RFIgcHJpdmF0ZSB0cmFuc2ZlciBzdXBwb3J0IHRvIHRoZSBTeW5vcHN5cwpEZXNpZ25XYXJlIEkz
QyBjb250cm9sbGVyIGRyaXZlci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5k
ZXggMzRhYThmOGUxYTBhMi4uYWJhMjdhYmI3OTI3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkz
Yy1tYXN0ZXIuYwoKWyAuLi4gXQoKPiBAQCAtOTk1LDI4ICsxMDA2LDM2IEBAIHN0YXRpYyBpbnQg
ZHdfaTNjX21hc3Rlcl9pM2NfeGZlcnMoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+ICAJfQo+
ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBpM2NfbnhmZXJzOyBpKyspIHsKPiArCQl1MzIgcm53X2Nt
ZCA9IChtb2RlID09IEkzQ19TRFIpID8gaTNjX3hmZXJzW2ldLnJudyA6IGkzY194ZmVyc1tpXS5j
bWQ7Cj4gKwkJYm9vbCBybncgPSBkd19jbWRfaXNfcmVhZChybndfY21kLCBtb2RlKTsKPiAgCQlz
dHJ1Y3QgZHdfaTNjX2NtZCAqY21kID0gJnhmZXItPmNtZHNbaV07Cj4gIAo+ICAJCWNtZC0+Y21k
X2hpID0gQ09NTUFORF9QT1JUX0FSR19EQVRBX0xFTihpM2NfeGZlcnNbaV0ubGVuKSB8Cj4gIAkJ
CUNPTU1BTkRfUE9SVF9UUkFOU0ZFUl9BUkc7Cj4gIAo+IC0JCWlmIChpM2NfeGZlcnNbaV0ucm53
KSB7Cj4gKwkJaWYgKHJudykgewo+ICAJCQljbWQtPnJ4X2J1ZiA9IGkzY194ZmVyc1tpXS5kYXRh
LmluOwo+ICAJCQljbWQtPnJ4X2xlbiA9IGkzY194ZmVyc1tpXS5sZW47Cj4gLQkJCWNtZC0+Y21k
X2xvID0gQ09NTUFORF9QT1JUX1JFQURfVFJBTlNGRVIgfAo+IC0JCQkJICAgICAgQ09NTUFORF9Q
T1JUX1NQRUVEKGRldi0+aW5mby5tYXhfcmVhZF9kcyk7Cj4gKwkJCWNtZC0+Y21kX2xvID0gQ09N
TUFORF9QT1JUX1JFQURfVFJBTlNGRVI7Cj4gIAo+ICAJCX0gZWxzZSB7Cj4gIAkJCWNtZC0+dHhf
YnVmID0gaTNjX3hmZXJzW2ldLmRhdGEub3V0Owo+ICAJCQljbWQtPnR4X2xlbiA9IGkzY194ZmVy
c1tpXS5sZW47Cj4gLQkJCWNtZC0+Y21kX2xvID0KPiAtCQkJCUNPTU1BTkRfUE9SVF9TUEVFRChk
ZXYtPmluZm8ubWF4X3dyaXRlX2RzKTsKPiAgCQl9CgpbU2V2ZXJpdHk6IEhpZ2hdCkFzIHJlcG9y
dGVkIGJ5IEZyYW5rIExpIG9uIHYyIFsxXSwgc2hvdWxkIHRoZSBGSUZPIGRlcHRoIGNoZWNrIGxv
b3AgYW5kCnRoZSBwb3N0LXRyYW5zZmVyIGxlbmd0aCB1cGRhdGUgbG9vcCBpbiBkd19pM2NfbWFz
dGVyX2kzY194ZmVycygpIGFsc28KdXNlIGR3X2NtZF9pc19yZWFkKCkgaW5zdGVhZCBvZiB0ZXN0
aW5nIGkzY194ZmVyc1tpXS5ybncgZGlyZWN0bHk/CgpJbiBzdHJ1Y3QgaTNjX3hmZXIsIHJudyBh
bmQgY21kIHNoYXJlIGFuIGFub255bW91cyB1bmlvbjoKCmluY2x1ZGUvbGludXgvaTNjL2Rldmlj
ZS5oOgpzdHJ1Y3QgaTNjX3hmZXIgewoJdW5pb24gewoJCXU4IHJudzsKCQl1OCBjbWQ7Cgl9OwoK
Rm9yIGFueSBIRFItRERSIHdyaXRlIHdpdGggYSBub24temVybyBjb21tYW5kIGNvZGUgKDB4MDEu
LjB4N2YpLAppM2NfeGZlcnNbaV0ucm53IGlzIG5vbi16ZXJvIGV2ZW4gdGhvdWdoIGJpdCA3IChI
RFJfRERSX0NNRF9SRUFEKSBpcwpjbGVhci4gIFRoZSBvdGhlciB0d28gbG9vcHMgaW4gZHdfaTNj
X21hc3Rlcl9pM2NfeGZlcnMoKSBzdGlsbCBjaGVjawppZiAoaTNjX3hmZXJzW2ldLnJudyksIHNv
IEhEUi1ERFIgd3JpdGVzIHdpdGggY21kIGluIDB4MDEuLjB4N2YgYXJlCmNvdW50ZWQgaW50byBu
cnh3b3JkcyBpbnN0ZWFkIG9mIG50eHdvcmRzIGR1cmluZyB0aGUgZGF0YWZpZm9kZXB0aCBjaGVj
aywKYW5kIG9uIGNvbXBsZXRpb24gdGhlaXIgaTNjX3hmZXJzW2ldLmxlbiBpcyBvdmVyd3JpdHRl
biB3aXRoIGNtZC0+cnhfbGVuCigwKS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL2F1
a0NmMXJlQjhMV2J1enFAbGl6aGktUHJlY2lzaW9uLVRvd2VyLTU4MTAKCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTEwMjExNTEu
NTgzODAtMS1wYXJhbWVAc3lub3BzeXMuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
