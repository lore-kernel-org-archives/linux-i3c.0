Return-Path: <SRS0=rmHr=GR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F680C433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Jan 2021 17:56:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CAC23B53
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Jan 2021 17:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CAC23B53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rte9hKb1evck7p/WgbxrsyGx+FN+VfkE8MitsbScsoE=; b=EqU2yOCJaMRHza43GMLHaogjo
	BcTlLrihQsoazTJ5ZEK7uGfUshtofmG29v7nrqRLOsRqIInilWPABUUO/Yi2o7LgQZOPKjfpRFEIC
	8gPiwHqHga/BWUPwCWHm4OeA9AkGJ1I5lPPZ3IDH/p1XsNSddXrQ6SXbSknwfpGrfz6r+hX7VeHPV
	GlUqhMmNrbw5O2YfWeqFsEDlv82FiBSl5H7999D+KVnVRjWLaZ3IgOrrOT+st3y4ROrRNOTpfpdGY
	RZMudfIP5aKfC3Qt9JSMptNgzyZBXTVbsPagV+59xVWA3FoN7Mi2oPr0/RaS90N6mpDfD7rmO5S+7
	P8U15Wk/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l06qk-00062I-GB; Thu, 14 Jan 2021 17:55:58 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l06qi-00061a-3K
 for linux-i3c@lists.infradead.org; Thu, 14 Jan 2021 17:55:57 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 96DCBE0004;
 Thu, 14 Jan 2021 17:55:52 +0000 (UTC)
Date: Thu, 14 Jan 2021 18:55:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: i3c: Describe Silvaco master binding
Message-ID: <20210114185551.5a4ef35d@xps13>
In-Reply-To: <20210111200821.GA2978830@robh.at.kernel.org>
References: <20201228161107.11804-1-miquel.raynal@bootlin.com>
 <20201228161107.11804-3-miquel.raynal@bootlin.com>
 <20210111200821.GA2978830@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_125556_259578_84662A4E 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgY29u
c3Q6IHNpbHZhY28saTNjLW1hc3RlciAgCj4gCj4gS2luZCBvZiBnZW5lcmljLiBPbmx5IDEgdmVy
c2lvbj8KCkkgYXBwZW5kZWQgYSAtdjEgYmVjYXVzZSBJIGhhdmUgbm8gY2x1ZSBvZiB0aGUgbnVt
YmVyaW5nIG5laXRoZXIgaWYKbW9yZSB2ZXJzaW9ucyB3aWxsIGFjdHVhbGx5IGNvbWUuCgpbLi4u
XQoKPiA+ICsKPiA+ICsgIGNsb2NrczoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogcGNsaywgdGhlIHN5c3RlbSBjbG9jawo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IGZhc3RfY2xrLCBmb3IgdGhlIGJ1cwo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHNsb3dfY2xr
LCBmb3Igb3RoZXIgZXZlbnRzICAKPiAKPiBUaGUgbmFtZXMgb2YgdGhlIGNsb2NrcyBnby4uLgoK
SXNzdWVzIGNvcnJlY3RlZC4KClsuLi5dCgo+ID4gKwo+ID4gKyAgIiNhZGRyZXNzLWNlbGxzIjoK
PiA+ICsgICAgY29uc3Q6IDEKPiA+ICsKPiA+ICsgICIjc2l6ZS1jZWxscyI6Cj4gPiArICAgIGNv
bnN0OiAwICAKPiAKPiBUaGlzIDIgc2hvdWxkIGJlIGRlZmluZWQgYnkgYSBidXMgYmluZGluZy4g
Q2FyZSB0byBjb252ZXJ0IGkzYy50eHQ/CgpQbGVhc2Ugc2VlIHY0IG9mIHRoaXMgc2VyaWVzLCB3
aGljaCBpbmNsdWRlcyBhIGNvbnZlcnN0aW9uIGF0dGVtcHQgdG8KaTNjLnlhbWwuIEkgYW0gZmFy
IGZyb20gY29tZm9ydGFibGUgd2l0aCB5YW1sIHNjaGVtYSBidXQsIGxldCdzIHNlZQp3aGF0IHlv
dSB0aGluay4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
