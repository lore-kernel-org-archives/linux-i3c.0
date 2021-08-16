Return-Path: <SRS0=Fyq7=NH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94768C4338F
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 07:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3325F61A82
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 07:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3325F61A82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c6eac2iS+8siYWzxpF1ABRGAAs4hY14n6ffHrn9iQY=; b=Cp2fIV/EAIW1T1
	37X8IOFB7jsSKPydwDRiz+zMuo1N/MJMsHLu7fIKJVndqWlZx+TCEKEAD0wWBObE2Ynsv8k1cIY1R
	iBKTPpdB4HiOJMVp9I+cGU+WPVKDBw4s10w+R2mOvun4c60cR6zNe6o79Y4M9Qey/YbymCVoWdPaC
	vv4fqgWlil6gdgQ1EgSWz0AaRA1Ge8xKMg1p/e6RTlYlpcLUsHBjiKaTAQPqctrbPkTRlWQYyMnaE
	ntebmGiehyFwPa9dhYBYfCfNRJ6297UAbfXE/hQYfYNn/dZEY4rZtGHMlmwfz6kDKE3KL2f3R61NP
	eVNOBv0kwICOWjkHQphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWbj-00GKRM-Nr; Mon, 16 Aug 2021 07:00:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWbg-00GKQm-Qg
 for linux-i3c@lists.infradead.org; Mon, 16 Aug 2021 07:00:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 753A740007;
 Mon, 16 Aug 2021 07:00:22 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:00:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com
Subject: Re: [PATCH V4 7/8] i3c: master: svc: add the missing module device
 table
Message-ID: <20210816090020.65e1a908@xps13>
In-Reply-To: <20210809063645.2289988-8-xiaoning.wang@nxp.com>
References: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
 <20210809063645.2289988-8-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_000025_044091_4CBFF9F3 
X-CRM114-Status: GOOD (  15.59  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIE1v
biwgIDkgQXVnIDIwMjEgMTQ6MzY6NDQKKzA4MDA6Cgo+IFRoZSBtaXNzaW5nIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUoKSB3aWxsIGNhdXNlIHRoZSBzdmMtaTNjLW1hc3RlciBjYW5ub3QKPiBiZSBhdXRv
IHByb2JlZCB3aGVuIGl0IGlzIGJ1aWx0IGluIG1vdWRsZS4KPiBTbyBhZGQgaXQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgo+IFJldmlld2Vk
LWJ5OiBKdW4gTGkgPGp1bi5saUBueHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IC0tLQo+IFY0OiBOZXcgcGF0Y2ggaW4gdGhp
cyBwYXRjaHNldAo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IDU5MzllMDkzNjY5Ny4uNzdmNjdkNDA3YWNkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTYxMiw2ICsxNjEyLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3ZjX2kzY19tYXN0ZXJfb2ZfbWF0Y2hf
dGJsW10gPSB7Cj4gIAl7IC5jb21wYXRpYmxlID0gInNpbHZhY28saTNjLW1hc3RlciIgfSwKPiAg
CXsgLyogc2VudGluZWwgKi8gfSwKPiAgfTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3Zj
X2kzY19tYXN0ZXJfb2ZfbWF0Y2hfdGJsKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIHN2Y19pM2NfbWFzdGVyID0gewo+ICAJLnByb2JlID0gc3ZjX2kzY19tYXN0ZXJfcHJv
YmUsCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
