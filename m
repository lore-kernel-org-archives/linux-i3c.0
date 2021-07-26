Return-Path: <SRS0=qHOf=MS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3D5C4338F
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jul 2021 08:49:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E823560C41
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jul 2021 08:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E823560C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDffPELuYD7//EjqI/WH+1WnLa5dMZ2tAeJ0awZcClg=; b=y42mMe5T42oBjq
	JpU8OKklTJnhAaorpaDbjDHdd9qHS9o85Ao52dTUJlWr+Q2+Un3fIXHNLLv/Pza5XMlVxq7Np8oM2
	Bj9VcgJGt0aXFPARa1dRzlFAErxal0kooiTd1mmMAf/eI8BpDDVN13BC6iIw0EeZoVa/MS5K8bdc0
	2ftKBvw0+ZdEq8Bb3pI0M7IzdoSpQNWPOkf9XWfqIkDxvtsfUFebptpn9o27z/Ss7/AtcylNS37qR
	N4ORjqn+aS1vY3WO53lMttYGx//rQm1t5lQ40JuoS8p+GOyidlv6UP6dgOusUFeDkCp6pmalKSeR+
	LSythglQBChI3rpVN+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wIP-00AILh-87; Mon, 26 Jul 2021 08:49:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wIL-00AILK-E9
 for linux-i3c@lists.infradead.org; Mon, 26 Jul 2021 08:49:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B4875C0008;
 Mon, 26 Jul 2021 08:48:59 +0000 (UTC)
Date: Mon, 26 Jul 2021 10:48:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [bug report] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20210726104858.40e5e056@xps13>
In-Reply-To: <20210726073319.GA9515@kili>
References: <20210726073319.GA9515@kili>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_014905_651937_1C6AA2EE 
X-CRM114-Status: GOOD (  10.67  )
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

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBNb24sIDI2IEp1bCAyMDIxCjEwOjMzOjE5ICswMzAwOgoKPiBIZWxsbyBNaXF1ZWwgUmF5bmFs
LAo+IAo+IFRoZSBwYXRjaCBkZDNjNTI4NDZkNTk6ICJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2ls
dmFjbyBJM0MgbWFzdGVyCj4gZHJpdmVyIiBmcm9tIEphbiAyMSwgMjAyMSwgbGVhZHMgdG8gdGhl
IGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlcgo+IHdhcm5pbmc6Cj4gCj4gCWRyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jOjY5MCBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKCkK
PiAJd2Fybjogc2xlZXBpbmcgaW4gYXRvbWljIGNvbnRleHQKPiAKPiBkcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICAgICA2NzAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9k
b19kYWFfbG9ja2VkKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAgICA2NzEgCQkJ
CQl1OCAqYWRkcnMsIHVuc2lnbmVkIGludCAqY291bnQpCj4gICAgIDY3MiB7Cj4gICAgIDY3MyAJ
dTY0IHByb3ZfaWRbU1ZDX0kzQ19NQVhfREVWU10gPSB7fSwgbmFja2luZ19wcm92X2lkID0gMDsK
PiAgICAgNjc0IAl1bnNpZ25lZCBpbnQgZGV2X25iID0gMCwgbGFzdF9hZGRyID0gMDsKPiAgICAg
Njc1IAl1MzIgcmVnOwo+ICAgICA2NzYgCWludCByZXQsIGk7Cj4gICAgIDY3NyAKPiAgICAgNjc4
IAl3aGlsZSAodHJ1ZSkgewo+ICAgICA2NzkgCQkvKiBFbnRlci9wcm9jZWVkIHdpdGggREFBICov
Cj4gICAgIDY4MCAJCXdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfUFJPQ19EQUEgfAo+ICAg
ICA2ODEgCQkgICAgICAgU1ZDX0kzQ19NQ1RSTF9UWVBFX0kzQyB8Cj4gICAgIDY4MiAJCSAgICAg
ICBTVkNfSTNDX01DVFJMX0lCSVJFU1BfTkFDSyB8Cj4gICAgIDY4MyAJCSAgICAgICBTVkNfSTND
X01DVFJMX0RJUihTVkNfSTNDX01DVFJMX0RJUl9XUklURSksCj4gICAgIDY4NCAJCSAgICAgICBt
YXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01DVFJMKTsKPiAgICAgNjg1IAo+ICAgICA2ODYgCQkvKgo+
ICAgICA2ODcgCQkgKiBFaXRoZXIgb25lIHNsYXZlIHdpbGwgc2VuZCBpdHMgSUQsIG9yIHRoZSBh
c3NpZ25tZW50IHByb2Nlc3MKPiAgICAgNjg4IAkJICogaXMgZG9uZS4KPiAgICAgNjg5IAkJICov
Cj4gLS0+IDY5MCAJCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNf
STNDX01TVEFUVVMsIHJlZywgIAo+ICAgICA2OTEgCQkJCQkgU1ZDX0kzQ19NU1RBVFVTX1JYUEVO
RChyZWcpIHwKPiAgICAgNjkyIAkJCQkJIFNWQ19JM0NfTVNUQVRVU19NQ1RSTERPTkUocmVnKSwK
PiAgICAgNjkzIAkJCQkJIDEsIDEwMDApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gVGhpcyBpcyBjYWxsZWQgd2l0aCBhIGxvY2sgaGVsZCBh
bmQgdGhlIGNvZGUgaXMgZG9pbmcgYSAxIHVzIHNsZWVwLgoKWWVzLCB0aGVyZSBpcyBhIHBlbmRp
bmcgcGF0Y2ggZm9yIHRoaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRj
aC8xNDYxNTIwLwoKVGhhbmtzIGFueXdheSBmb3IgdGhlIHJlcG9ydCEKClRoYW5rcywKTWlxdcOo
bAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
