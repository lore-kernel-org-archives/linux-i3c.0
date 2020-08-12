Return-Path: <SRS0=SnxP=BW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A09C433DF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 15:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCA620838
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Aug 2020 15:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1Ti/IH8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCA620838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1NLlPZ9ZGZJIFybJnyUfFmYq6aP1LZtaNOExWONjJ+U=; b=H1Ti/IH8JQsW6S3M2LZ3+YcKX
	RMzW2ZUPjwQ07F6uhka8ialK7NY0IczBAnI/GYzff/4ufnZA+h32bNFF7LK22xMIrtdIqMLvVU/3y
	gjHMyX8J+CPSIgTAcG1XA7vrX9KuxuAnXT9oU+dgQBZB6Qud09GQyMwrsb9aoBJAelr/X4c92aoun
	qAe1Is54M9dfkPZp55+2ttV462i9AyhlotcTgXv5Lfa/tOhPL5l8pkY/K5lAij8k3oFK/5G1H++Yi
	RZRqaGVp6zXiltXNdml0kVZwEdw0j0i8aWNA9KO8zbYb/HuKUlHsv0PlrWtXNrEqMHqK+r2+mxNRJ
	2iUeIxk8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5sMH-0008Nq-Vc
	for linux-i3c@archiver.kernel.org; Wed, 12 Aug 2020 15:08:06 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sMF-0008NS-Hw
 for linux-i3c@lists.infradead.org; Wed, 12 Aug 2020 15:08:04 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 28CE020008;
 Wed, 12 Aug 2020 15:07:59 +0000 (UTC)
Date: Wed, 12 Aug 2020 17:07:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add Silvaco I3C master
Message-ID: <20200812170758.452f7048@xps13>
In-Reply-To: <20200812141312.3331-4-miquel.raynal@bootlin.com>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
 <20200812141312.3331-4-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_110804_055973_EE7F9EB9 
X-CRM114-Status: GOOD (  10.86  )
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

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBXZWQsIDEyIEF1ZyAyMDIwCjE2OjEzOjEyICswMjAwOgoKPiBBZGQgQ29ub3IgYW5kIG15c2Vs
ZiBhcyBtYWludGFpbmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gKiBOb25l
Lgo+IAo+ICBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4g
aW5kZXggZTYyN2VkNjBkNzVhLi5mZWRkMTA1Mzc3MjMgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5F
UlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNTc2NCw2ICsxNTc2NCwxNCBAQCBTOglNYWlu
dGFpbmVkCj4gIEY6CURvY3VtZW50YXRpb24vZmIvc203MTJmYi5yc3QKPiAgRjoJZHJpdmVycy92
aWRlby9mYmRldi9zbTcxMioKPiAgCj4gK1NJTFZBQ08gSTNDIERVQUwtUk9MRSBNQVNURVIKPiAr
TToJTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiArTToJQ29ub3Ig
Q3VsaGFuZSA8Y29ub3IuY3VsaGFuZUBzaWx2YWNvLmNvbT4KPiArTDoJbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiArUzoJTWFpbnRhaW5lZAo+ICtGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTNjL3N2YyxpM2MtbWFzdGVyLnlhbWwKClNob3VsZCBiZSBzaWx2YWNv
LGkzYy1tYXN0ZXIueWFtbC4uLgoKSSdsbCBjb3JyZWN0IGluIHYzLgoKVGhhbmtzLApNaXF1w6hs
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
