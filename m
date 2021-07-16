Return-Path: <SRS0=KHFp=MI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66292C12002
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F6A613E7
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F6A613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTcgHSuyZ467OYhMqSCddRKk+JLfZtqAcWYGjNT5XmE=; b=3DcDPsXVo6cI1U
	QD547DKLuYgC5uTu0SDIBykhsqtaIG10+j9AS1hkxQOuV8Qg47WGtOqIJQKzx1qbkO92OP8iQU82B
	G36MqhzOjyjs0XO8cL9s55fI24FOO4As7ptIcTfpEN6Wl5M5XL3H9hmhX7j19XzjB8JErkYzBDcd7
	RBcVDUAQLFd7gFCyS3X6QSV96+5GDr9URCI9zIF2z80oyhRV/X1tDqTMOAy4ElPLkG+2SScurkPAK
	gfp4YxGdEOdRIGGeB9QjO95nk/s2+uY0SIEYMK7dPj8Z439mkzCNUdN6P3VmkCCIVMHcIyemXtzys
	6AbOg1g0zJGqsMMp1Zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IdW-003b6A-4U; Fri, 16 Jul 2021 07:51:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IdS-003b4C-Lv
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 07:51:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2A134C0005;
 Fri, 16 Jul 2021 07:51:47 +0000 (UTC)
Date: Fri, 16 Jul 2021 09:51:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 vitor.soares@synopsys.com, boris.brezillon@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] i3c: master: svc: some bug fixes
Message-ID: <20210716095146.2182acb3@xps13>
In-Reply-To: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_005150_916867_C909DC69 
X-CRM114-Status: GOOD (  22.11  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIFRo
dSwgMTUgSnVsIDIwMjEgMTY6MjQ6MDkKKzA4MDA6Cgo+IEhpLAo+IAo+IEkgYW0gdXNpbmcgU1ZD
IEkzQyBtb2R1bGUgcmVjZW50bHkuIEkgZml4IHNvbWUgcHJvYmxlbXMgYW5kIGFsc28gaGF2ZSBh
Cj4gcXVlc3Rpb24uCj4gCj4gTXkgcXVlc3Rpb24gaXM6Cj4gQ2FuIEkzQyBidXMgc3VwcG9ydCBw
dXJlIEkyQyBtb2RlIGluIGtlcm5lbD8KPiBPciBpbiBvdGhlciB3b3JkcywgaW4gbWl4ZWQgbW9k
ZSwgbXVzdCB0aGVyZSBiZSBhdCBsZWFzdCBvbmUgSTNDIGRldmljZSBvbgo+IHRoZSBJM0MgYnVz
Pwo+IAo+IFRoZSBwdXJlIEkzQyBtb2RlIHdvcmtzIGZpbmUuIEJ1dCB3aGVuIG9ubHkgaGF2ZSBv
bmUgSTJDIGRldmljZSBvbiB0aGUKPiBJM0MgYnVzLCB0aGUgcHJvYmUgaW4gZnVuY3Rpb24gaTNj
X21hc3Rlcl9idXNfaW5pdCgpIHdpbGwgZ28gZXJyb3IuIEJlY2F1c2UKPiB0aGVyZSBpcyBubyBv
bmUgb24gSTNDIGJ1cyBjYW4gQUNLIHRoZSBJM0MgbWVzc2FnZSB3aXRoIEkzQyBtZXNzYWdlIHNw
ZWVkLiBUaGVuCj4gaXQgd2lsbCByZXR1cm4gZXJyb3IgYXQgZnVuY3Rpb24gaTNjX21hc3Rlcl9y
c3RkYWFfbG9ja2VkKCkgYmVjYXVzZSBvZiBubyBBQ0sKPiBmb3IgMHg3ZSBzdGFydCBieXRlLgo+
IFdoZW4gSSB1c2UgdGhlIGZvbGxvd2luZyBkdGIgY29uZmlndXJhdGlvbiwgdGhlIGFib3ZlIHBy
b2JsZW0gb2NjdXJzLgo+ICZpM2MyIHsKPiAJI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gCSNzaXpl
LWNlbGxzID0gPDA+Owo+IAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IAlwaW5jdHJsLTAg
PSA8JnBpbmN0cmxfaTNjMj47Cj4gCWkyYy1zY2wtaHogPSA8NDAwMDAwPjsKPiAJc3RhdHVzID0g
Im9rYXkiOwo+IAo+IAlsc202ZHNvX2kyYzogaW11QDZhIHsKPiAJCWNvbXBhdGlibGUgPSAic3Qs
bHNtNmRzbyI7Cj4gCQlyZWcgPSA8MHg2YSAweDAgMHg1MD47Cj4gCX07Cj4gfTsKPiAKPiBCdXQg
SSBzYXcgYSBzaW1pbGFyIGNvbmZpZ3VyYXRpb24gZXhhbXBsZSBpbgo+IC9ob21lL254ZjQ3NzQ5
L3dvcmsva2VybmVsL2kzYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3Nu
cHMsZHctaTNjLW1hc3Rlci50eHQuCj4gSSB3b25kZXIgaWYgdGhhdCBjYW4gd29yayBub3JtYWxs
eT8KPiAKPiBJIGtub3cgdGhlIGRlZmluaXRpb24gaW4gdGhlIHNwZWNpZmljYXRpb24gaXM6Cj4g
TWl4ZWQgeHh4IEJ1czogSTNDIEJ1cyB0b3BvbG9neSB3aXRoIGJvdGggSTJDIGFuZCBJM0MgRGV2
aWNlcyBwcmVzZW50Cj4gb24gdGhlIEkzQyBCdXMuLi4KPiBCdXQgSSB0aGluayBpdCBpcyBmZWFz
aWJsZSB0byB1c2UgcHVyZSBJMkMgbW9kZSB3aXRoIEkzQyBtb2R1bGUuCj4gSSBhbSBub3Qgc3Vy
ZSB3aHkgdGhlIHVzZSBvZiBwdXJlIEkyQyBtb2RlIGlzIHJlc3RyaWN0ZWQgaW4gdGhlIHNvZnR3
YXJlLgo+IAo+IElmIHRoZXJlIGFyZSBlcnJvcnMgaW4gbXkgaWRlYXMsIHBsZWFzZSBjb3JyZWN0
IG1lIGluIHRpbWUuIFRoYW5rIHlvdSBhbGwuCgpBcyB5b3UgcG9pbnRlZCBvdXQsIEkgYW0gbm90
IGF3YXJlIG9mIGEgc3BlY2lmaWMgSTJDIG9ubHkgYnVzIHNldHRpbmcKYnV0IGlmIHlvdSBmaW5k
IGEgd2F5IHRvIHdvcmthcm91bmQgdGhlIGlzc3VlIHJhaXNlZCBhYm92ZSBieSBzb2Z0d2FyZQpp
biBhIHJhdGhlciBjbGVhbiB3YXksIHRoZW4uLi4gd2h5IG5vdD8KCj4gSGVyZSBhcmUgdGhlIGZp
eGVzLgo+IAo+IENsYXJrIFdhbmcgKDQpOgo+ICAgaTNjOiBtYXN0ZXI6IHN2YzogbW92ZSBtb2R1
bGUgcmVzZXQgYmVoaW5kIGNsayBlbmFibGUKPiAgIGkzYzogbWFzdGVyOiBzdmM6IGZpeCBhdG9t
aWMgaXNzdWUKPiAgIGkzYzogbWFzdGVyOiBzdmM6IGFkZCBzdXBwb3J0IGZvciBzbGF2ZSB0byBz
dG9wIHJldHVybmluZyBkYXRhCj4gICBpM2M6IG1hc3Rlcjogc3ZjOiBzZXQgT0RTVE9QIHRvIGxl
dCBJMkMgZGV2aWNlIHNlZSB0aGUgU1RPUCBzaWduYWwKPiAKPiAgZHJpdmVycy9pM2MvbWFzdGVy
L3N2Yy1pM2MtbWFzdGVyLmMgfCA0NSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCgpUaGFu
a3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
