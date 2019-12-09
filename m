Return-Path: <SRS0=ySRA=Z7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E37C43603
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 12:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C382C20726
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 12:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oq/19So1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C382C20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iD7dLt6+boKPXolCIICmpTvlRUZSPHNPMpnuqCxuHuE=; b=oq/19So1NOv9RU
	LT5GVap1OVotKVk/o8JAUVmI8gRJtynFe8WXdMZfINrkpdcgPnIGLDx7tve90pIaN00k8HlLC7r0B
	qGtq5w56jdfX1kZX5NzcT6jZep2jvx63dyzEzYEq5/oJrJE8NyZQldWpd49BzV+YrEOU4/2amh80X
	3RHYOntyDR0lj5QZvuBKcG3/nJuR1Z+6fowjNUVPwgx1CeB3khbBYyJAQGvjrjK/E/AT/WJtRA0/s
	8YqROMZXOb+5tgUy2Q6fUdygAqWOkuFY0vtD9MI041jMexgn0WlJyjTfpRUJOciVYrNFg8WCHF62p
	reAruKr5n0HWHmAFUgcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieI7M-0008Co-VQ; Mon, 09 Dec 2019 12:26:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieI7I-0008CL-SP
 for linux-i3c@lists.infradead.org; Mon, 09 Dec 2019 12:26:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3ADC628D937;
 Mon,  9 Dec 2019 12:26:19 +0000 (GMT)
Date: Mon, 9 Dec 2019 13:26:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH] i3c: make sure the PID is set before registering the
 device
Message-ID: <20191209132616.22ba009c@collabora.com>
In-Reply-To: <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
 <20191209104711.5a549d31@collabora.com>
 <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_042621_049339_D5FE9CF2 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?UHJ6ZW15c8WCYXc=?= Gaj <pgaj@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCA5IERlYyAyMDE5IDEyOjIwOjAzICswMDAwClZpdG9yIFNvYXJlcyA8Vml0b3IuU29h
cmVzQHN5bm9wc3lzLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IEZyb206IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gRGF0ZTogTW9uLCBEZWMg
MDksIDIwMTkgYXQgMDk6NDc6MTEKPiAKPiA+IE9uIFN1biwgOCBEZWMgMjAxOSAxNToxODozNCAr
MDEwMAo+ID4gUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPiB3cm90ZToKPiA+ICAg
Cj4gPiA+IEZyb206IFByemVteXNsYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+ID4gPiAKPiA+
ID4gUHJvdmlzaW9uZWQgSUQgKFBJRCkgaXMgdGhlIHZhbHVlIHdpdGggd2hpY2ggZGV2aWNlIGRy
aXZlcnMgYXJlCj4gPiA+IG1hdGNoZWQuIEkgY2hlY2sgdGhlIHZhbHVlIGJlZm9yZSByZWdpc3Rl
cmluZyB0aGUgZGV2aWNlLgo+ID4gPiAgIAo+ID4gCj4gPiBDYW4gdGhpcyBzaXR1YXRpb24gKGhh
dmluZyBhIGRldmljZSB3aXRoIGEgREEgYnV0IHdpdGhvdXQgYSB2YWxpZCBQSUQpCj4gPiBoYXBw
ZW4gcmlnaHQgbm93IG9yIGlzIHRoaXMgc29tZXRoaW5nIHlvdSBuZWVkIHRvIHN1cHBvcnQgc2Vj
b25kYXJ5Cj4gPiBtYXN0ZXJzIHdobyByZWNlaXZlIGRldmljZSBEQSAodGhyb3VnaCBERUZTVkxT
KSB3aXRob3V0IGJlaW5nIGFibGUgdG8KPiA+IHF1ZXJ5IGV4dHJhIGluZm9ybWF0aW9uIHVudGls
IHRoZXkgb3duIHRoZSBidXM/ICAKPiAKPiBUaGlzIGlzIHRoZSB1c2UgY2FzZSB3aGVyZSBhIGRl
dmljZSBmYWlscyB0aGUgCj4gaTNjX21hc3Rlcl9wcmVfYXNzaWduX2R5bl9hZGRyKCkgYW5kIEkg
YWxyZWFkeSBtZW50aW9uIGl0IG9uIFsxXS4KPiBJIHN0aWxsIHRoaW5rIHRoZSBiZXN0IHdheSBp
cyB0byBkZXRhY2gvZnJlZSB0aGUgZGV2aWNlcyB0aGF0IGZhaWxzIAo+IGR1cmluZyBpM2NfbWFz
dGVyX3ByZV9hc3NpZ25fZHluX2FkZHIoKS4KCkFuZCBJIGRpc2FncmVlIChJIGdhdmUgbXkgYXJn
dW1lbnRzIGFscmVhZHksIHNvIHdvbid0IHJlcGVhdCB0aGVtCmhlcmUpLiBDYW4gd2UgbW92ZSBv
biBwbGVhc2U/IENhbiB5b3Ugc2VuZCBhIG5ldyB2ZXJzaW9uIHRoYXQgZG9lcyB3aGF0Ckkgc3Vn
Z2VzdCwgb3Igc2hvdWxkIEkgYXNrIFByemVtZWsgdG8gZG8gaXQ/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
