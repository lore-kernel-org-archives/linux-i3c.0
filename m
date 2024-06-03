Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0311BC25B75
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jun 2024 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExSfzEwxnLaaQGWvimiFjsKL986VGM13eZX35m9TKho=; b=pZHTu6o3N/aYOe
	2I3EsGjMjp/LZPNHKlMV1sNtVT4ZCrICMKu23ekjg3V+r/LsjbftBArGS839z+NYMzFqJozK4hWhw
	MEt+gYHiROQ2PS7/ClmqcO2kFSM1nwlf2bM1kKvHWEznpIA+NFbe5xxcxPwTIsyRcIifOWU4oaA2z
	00Spk0myHpzGu7/y7XFb2Y/Z4XVNv1pzJwYHaTWABD51echaHNc0o9EpY1aglJzbyvmLVRtINM+SP
	0L1hUWLHDU0JaEX8uiaqcDa3790vzAWX6EtapxoroXffx8VPYiVXIQMXGiN29S1Va4HXKQv8BvR2t
	NKzmCHjO7lp32v0CGtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Eg-0000000Gzv0-2hbu;
	Mon, 03 Jun 2024 14:00:30 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Ed-0000000GzuM-21dT
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jun 2024 14:00:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5293F40019;
	Mon,  3 Jun 2024 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717423223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUiKeSDAw5PSWaHAWumiSmz2tV9iwBOhkTk5YbNtRJw=;
	b=Vnk9rxj2LrJ31ASbDAuodEeVDzQEiuJI6BXER38I5f8OLktmjqg4+Ot1G7uXJrLWYDCMPj
	r4c1Ejhl02HzHSrCCx+M31d9nMPrNl6Ewk55kp1kGd1EowRllfKsbSxfY8PiOVyq6xH6YD
	m/8WOmH+Ojb/qlevO6BD5LPiCUpo0HG5MHXTF+fRt4pjI0aJ7vdJBFRg8appj96hZhvHQf
	KtEY+gP+5Ao7sQMYTeQqKbNEi9AsPbIK+yKoVP4sbrORpGDW2PLjnyj+P7OUfwMkUAasAX
	+39x0pHa2zrVb3Rwxi931X2VeKDeY7yNKIX0zirc72/gyF1cUoQEeq40ch5sxA==
Date: Mon, 3 Jun 2024 16:00:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: resend target address when get
 NACK
Message-ID: <20240603160018.29498c2f@xps-13>
In-Reply-To: <20240531163301.1401281-1-Frank.Li@nxp.com>
References: <20240531163301.1401281-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_070027_693623_5C3097CF 
X-CRM114-Status: GOOD (  11.58  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMzEgTWF5IDIwMjQgMTI6
MzM6MDAgLTA0MDA6Cgo+IEFjY29yZGluZyB0byBJM0MgU3BlYyAxLjEuMSwgMTEtSnVuLTIwMjEs
IHNlY3Rpb246IDUuMS4yLjIuMzoKPiAKPiBJZiB0aGUgQ29udHJvbGxlciBjaG9vc2VzIHRvIHN0
YXJ0IGFuIEkzQyBNZXNzYWdlIHdpdGggYW4gSTNDIER5bmFtaWMKPiBBZGRyZXNzLCB0aGVuIHNw
ZWNpYWwgcHJvdmlzaW9ucyBzaGFsbCBiZSBtYWRlIGJlY2F1c2UgdGhhdCBzYW1lIEkzQyBUYXJn
ZXQKPiBtYXkgYmUgaW5pdGlhdGluZyBhbiBJQkkgb3IgYSBDb250cm9sbGVyIFJvbGUgUmVxdWVz
dC4gU28sIG9uZSBvZiB0aHJlZQo+IHRoaW5ncyBtYXkgaGFwcGVuOiAoc2tpcCAxLCAyKQo+IAo+
IDMuIFRoZSBBZGRyZXNzZXMgbWF0Y2ggYW5kIHRoZSBSblcgYml0cyBhbHNvIG1hdGNoLCBhbmQg
c28gbmVpdGhlcgo+IENvbnRyb2xsZXIgbm9yIFRhcmdldCB3aWxsIEFDSyBzaW5jZSBib3RoIGFy
ZSBleHBlY3RpbmcgdGhlIG90aGVyIHNpZGUgdG8KPiBwcm92aWRlIEFDSy4gQXMgYSByZXN1bHQs
IGVhY2ggc2lkZSBtaWdodCB0aGluayBpdCBoYWQgIndvbiIgYXJiaXRyYXRpb24sCj4gYnV0IG5l
aXRoZXIgc2lkZSB3b3VsZCBjb250aW51ZSwgYXMgZWFjaCB3b3VsZCBzdWJzZXF1ZW50bHkgc2Vl
IHRoYXQgdGhlCj4gb3RoZXIgZGlkIG5vdCBwcm92aWRlIEFDSy4KPiAuLi4KPiBGb3IgZWl0aGVy
IHZhbHVlIG9mIFJuVzogRHVlIHRvIHRoZSBOQUNLLCB0aGUgQ29udHJvbGxlciBzaGFsbCBkZWZl
ciB0aGUKPiBQcml2YXRlIFdyaXRlIG9yIFByaXZhdGUgUmVhZCwgYW5kIHNob3VsZCB0eXBpY2Fs
bHkgdHJhbnNtaXQgdGhlIFRhcmdldAo+IAkJCQkJCSAgICBeXl5eXl5eXl5eXl5eXl5eXl5eCj4g
QWRkcmVzcyBhZ2FpbiBhZnRlciBhIFJlcGVhdGVkIFNUQVJUIChpLmUuLCB0aGUgbmV4dCBvbmUg
b3IgYW55IG9uZSBwcmlvcgo+IF5eXl5eXl5eXl5eXl4KPiB0byBhIFNUT1AgaW4gdGhlIEZyYW1l
KS4gU2luY2UgdGhlIEFkZHJlc3MgSGVhZGVyIGZvbGxvd2luZyBhIFJlcGVhdGVkCj4gU1RBUlQg
aXMgbm90IGFyYml0cmF0ZWQsIHRoZSBDb250cm9sbGVyIHdpbGwgYWx3YXlzIHdpbiAoc2VlIFNl
Y3Rpb24KPiA1LjEuMi4yLjQpLgo+IAo+IFJlc2VuZCB0YXJnZXQgYWRkcmVzcyBhZ2FpbiBpZiBh
ZGRyZXNzIGlzIG5vdCA3RSBhbmQgY29udHJvbGxlciBnZXQgTkFDSy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KCkknbSBub3QgZ2V0dGluZyAxMDAlIG9m
IGl0LCBidXQgbG9va3Mgb2theSwgc286CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
