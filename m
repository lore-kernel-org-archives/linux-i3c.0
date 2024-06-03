Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996BBC25B75
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jun 2024 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT/I0KLNAt+LyuRh9rlBwR7dvfYOuV+3iP7XCnHY0BI=; b=ZB+z847nUXvVEF
	m0HWulGanKTqBxXVxB90z8IMcf6up35fn4GxE47WjaG/BMh+e478E7X/qMj9H1GsINlza4ei49IvS
	G+A2SgAC4aPSpYBa/dlphqKxrgb/m+LkuIWJgf3SH3f7CCZC5xMkGeXO221xMe6N7V3VHgE9ETIT5
	p787h1R+9nHGdow6u+1bLzxlfYi42jh41gWlEbBvb4Ez8CbBD/zb9/WwzLs/5LqiwA8EaWE/Ziln3
	QD/rQj7gfN1S16luiEaU8y+mEdbisrFaEWjLf6EVJc7zmIIJYPUeYP+Pl6lesM2MfttbK6mEr1V80
	gcqmF440WMqfrRwWWPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE844-0000000GyOT-0BCE;
	Mon, 03 Jun 2024 13:49:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE840-0000000GyMp-2gOx
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jun 2024 13:49:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BECF1BF206;
	Mon,  3 Jun 2024 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717422563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9K5vR7nav8alZNy7Ozvejb3OKNpcsYE3Cftk5p10Yc=;
	b=AqckkOygqLn9SRaAoRNMxvTe3hG4ggDylcf4QJ5+QOa9MMn0EDTuOql6MC7pgK4pNBNNoU
	KzjrUnUBDJrVwWpFTYQinKJWB3ZBEXDA/U0zK2Y6gHRpedMkbL1cKnAuzF0kye3nJgRqT7
	S3mOVhiAOA5wT5YhOyEzVtr1hqn923rLfx5HLNLwaA2OeIFqz+oKFdkZR8o3U6dHx5A4rk
	rodnFu7g5iI29Tl1aPwAAHrJiSTXD1rmYsW+M23jtKUxC2+cQxQFXfHcNhUE5c6gUD3BcB
	XgvCdFjbeggzHgLJIicAiH31l7bGuAGIPsJTpFtnr9eNQr+J/qrObd1i7Hs1AA==
Date: Mon, 3 Jun 2024 15:49:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: fix IBIWON not set if IBI follow
 a hot join
Message-ID: <20240603154918.4b0c95b2@xps-13>
In-Reply-To: <20240531154308.1246214-1-Frank.Li@nxp.com>
References: <20240531154308.1246214-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_064928_964585_62652D98 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMzEgTWF5IDIwMjQgMTE6
NDM6MDggLTA0MDA6Cgo+IFdoZW4gYW4gSW4tQmFuZCBJbnRlcnJ1cHQoSUJJKSBvY2N1cnMgYWZ0
ZXIgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhX2xvY2tlZCgpLAo+IHR5cGljYWxseSB0cmlnZ2VyZWQg
ZHVyaW5nIGEgSG90IEpvaW4gKEhKKSBldmVudCwgdGhlIElCSVdPTiBmbGFnIGZhaWxzIHRvCj4g
YmUgc2V0IHdoZW4gaXNzdWluZyBhbiBhdXRvIElCSSBjb21tYW5kLgo+IAo+IFRoZSBpc3N1ZSBz
dGVtcyBmcm9tIHRoZSBvbWlzc2lvbiBvZiBlbWl0dGluZyBTVE9QIHVwb24gc3VjY2Vzc2Z1bAo+
IGV4ZWN1dGlvbiBvZiBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKCkuIENvbnNlcXVlbnRs
eSwgdGhlIGNvbnRyb2xsZXIKPiBpbnRlcnByZXRzIGl0IGFzIGEgcmVwZWF0IHN0YXJ0IHdoZW4g
ZW1pdHRpbmcgdGhlIGF1dG8gSUJJIGNvbW1hbmQuIFBlciB0aGUKPiBJM0Mgc3BlY2lmaWNhdGlv
biwgYW4gSUJJIHNob3VsZCBuZXZlciBvY2N1ciBkdXJpbmcgYSByZXBlYXQgc3RhcnQsIHRodXMK
PiBwcmV2ZW50aW5nIHRoZSBJQklXT04gZmxhZyBmcm9tIGJlaW5nIHNldC4KPiAKPiBFbWl0IFNU
T1AgcmVnYXJkbGVzcyBvZiB0aGUgc3VjY2VzcyBvciBmYWlsdXJlIG9mCj4gc3ZjX2kzY19tYXN0
ZXJfZG9fZGFhX2xvY2tlZCgpIHRvIG1hdGNoIEkzQyBzcGVjIHJlcXVpcmVtZW50Lgo+IAo+IENj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBt
YXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQoKVGhlcmUgd2FzIG5v
IGhvdC1qb2luIHN1cHBvcnQgaW4gdGhpcyBjb21taXQuIFlvdSBjYW4gcHJvYmFibHkgdXNlCmlu
c3RlYWQ6CgpGaXhlczogMDViMjZjMzFhNDg1ICgiaTNjOiBtYXN0ZXI6IHN2YzogYWRkIGhvdCBq
b2luIHN1cHBvcnQiKQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
