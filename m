Return-Path: <SRS0=till=GV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B6BC433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Jan 2021 15:25:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAAF22C7E
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Jan 2021 15:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAAF22C7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DiCV4AlnwawqEPQa502H19ImIJMFpdnKUhr3vgVXRU4=; b=KOskX3BL/x0nbkh7HDIbXMs/6
	0gYYGEgSjVEjbiyRMeMy2MSgquzthscu7IDnSOHMAnoMmILWhSMnS8iPYZ6LaRZ7xsMjGNIwWgz+e
	U/fG2ey37fI+/JW8eiLnxj1cFg93TIClfqJtrdau9jmy5f9wMAhhfAOl/nWvCFE9avK52kVL3sVuj
	w2nkeq8CcHz2mVSgkCvM/5jfPbjwioVcWcsIxbcIf+dscBxRiIL3SzkRUDdel3jNnT2aPWQAn+++o
	lyggpTIu4FVr3nZrqlzwjNld6IJdPF9U9dvrFtpuSuDBPCDqKQ8rSlySV2bW8FkPq94ZshxbmIP/7
	DmoRy8arw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1WP9-00049t-IM; Mon, 18 Jan 2021 15:25:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1WP6-00049C-Iv
 for linux-i3c@lists.infradead.org; Mon, 18 Jan 2021 15:25:17 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E713DFF813;
 Mon, 18 Jan 2021 15:25:09 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:25:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: i3c: Convert controller description
 to yaml
Message-ID: <20210118162508.2f2079da@xps13>
In-Reply-To: <20210115170312.GA1434283@robh.at.kernel.org>
References: <20210114175558.17097-1-miquel.raynal@bootlin.com>
 <20210114175558.17097-2-miquel.raynal@bootlin.com>
 <20210115170312.GA1434283@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_102516_830563_41A14DB7 
X-CRM114-Status: GOOD (  12.32  )
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

SGkgUm9iLAoKPiA+ICsgICAgICByZWc6Cj4gPiArICAgICAgICBpdGVtczoKPiA+ICsgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgICAgMXN0IGNlbGwKPiA+ICsgICAg
ICAgICAgICAgID09PT09PT09Cj4gPiArCj4gPiArICAgICAgICAgICAgICBJMkMgYWRkcmVzcy4g
MTAgYml0IGFkZHJlc3NpbmcgaXMgbm90IHN1cHBvcnRlZC4gRGV2aWNlcyB3aXRoCj4gPiArICAg
ICAgICAgICAgICAxMC1iaXQgYWRkcmVzcyBjYW4ndCBiZSBwcm9wZXJseSBwYXNzZWQgdGhyb3Vn
aCBERUZTTFZTIGNvbW1hbmQuCj4gPiArCj4gPiArICAgICAgICAgICAgICAybmQgY2VsbAo+ID4g
KyAgICAgICAgICAgICAgPT09PT09PT0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgIFNob3VsZCBi
ZSAwLgo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgM3JkIGNlbGwKPiA+ICsgICAgICAgICAgICAg
ID09PT09PT09Cj4gPiArCj4gPiArICAgICAgICAgICAgICBTaGFsbCBlbmNvZGUgdGhlIEkzQyBM
VlIgKExlZ2FjeSBWaXJ0dWFsIFJlZ2lzdGVyKToKPiA+ICsgICAgICAgICAgICAgIGJpdFszMTo4
XTogdW51c2VkL2lnbm9yZWQKPiA+ICsgICAgICAgICAgICAgIGJpdFs3OjVdOiBJMkMgZGV2aWNl
IGluZGV4LiBQb3NzaWJsZSB2YWx1ZXM6Cj4gPiArICAgICAgICAgICAgICAgICogMDogSTJDIGRl
dmljZSBoYXMgYSA1MCBucyBzcGlrZSBmaWx0ZXIKPiA+ICsgICAgICAgICAgICAgICAgKiAxOiBJ
MkMgZGV2aWNlIGRvZXMgbm90IGhhdmUgYSA1MCBucyBzcGlrZSBmaWx0ZXIgYnV0IHN1cHBvcnRz
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaGlnaCBmcmVxdWVuY3kgb24gU0NMCj4gPiArICAg
ICAgICAgICAgICAgICogMjogSTJDIGRldmljZSBkb2VzIG5vdCBoYXZlIGEgNTAgbnMgc3Bpa2Ug
ZmlsdGVyIGFuZCBpcyBub3QKPiA+ICsgICAgICAgICAgICAgICAgICAgICB0b2xlcmFudCB0byBo
aWdoIGZyZXF1ZW5jaWVzCj4gPiArICAgICAgICAgICAgICAgICogMy03OiByZXNlcnZlZAo+ID4g
KyAgICAgICAgICAgICAgYml0WzRdOiB0ZWxsIHdoZXRoZXIgdGhlIGRldmljZSBvcGVyYXRlcyBp
biBGTSAoRmFzdCBNb2RlKSBvcgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBGTSsgbW9kZToK
PiA+ICsgICAgICAgICAgICAgICAgKiAwOiBGTSsgbW9kZQo+ID4gKyAgICAgICAgICAgICAgICAq
IDE6IEZNIG1vZGUKPiA+ICsgICAgICAgICAgICAgIGJpdFszOjBdOiBkZXZpY2UgdHlwZQo+ID4g
KyAgICAgICAgICAgICAgICAqIDAtMTU6IHJlc2VydmVkICAKPiAKPiBXZSBjYW4gZG8gYSBiaXQg
YmV0dGVyOgo+IAo+IHJlZzoKPiAgIGl0ZW1zOgo+ICAgICAtIGl0ZW1zOiAgIyBOb3RlOiBkcm9w
IHRoZSAnLScgaWYgd2Ugc3VwcG9ydCBtb3JlIHRoYW4gMSBlbnRyeQo+ICAgICAgICAgLSBkZXNj
cmlwdGlvbjogSTJDIGFkZHJlc3MuLi4KPiAgICAgICAgICAgbWF4aW11bTogMHg3ZiAgIyBOb3Qg
c3VyZSB0aGlzIHdvcmtzLCBkbyB3ZSBzdXBwb3J0IHRoZSBoaWdoIAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAjIGZsYWcgYml0cyBoZXJlPwo+ICAgICAgICAgLSBjb25zdDogMAo+ICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogSTNDIExWUiAoTGVnYWN5IFZpcnR1YWwgUmVnaXN0ZXIpLi4uCgpJ
IGRlZmluaXRlbHkgdGhpbmsgdGhhdCBpdCBpcyBhIGdvb2QgbW92ZSB0byBwcm9wZXJseSBkZWZp
bmUgdGhlIGZhY3QKdGhhdCB3ZSBjYW4gYWNjZXB0IG9ubHkgYSBzaW5nbGUgcmVnIGVudHJ5IHdp
dGggdGhyZWUgY2VsbHMgLWFuZCB0aGVpcgpjb250ZW50LCBvdmVyYWxsLSwgYnV0IHRoaXMgc3lu
dGF4IGRvZXMgbm90IHdvcmsgYW5kIEkgcmVhbGx5IGRvbid0IGZpbmQKdGhlIHJpZ2h0IHdheSB0
byBkZXNjcmliZSBpdC4KClRoZSBlcnJvciBJIGdldCBpczoKCi0tLTg8LS0tCiAgICAgICByZWc6
CiAgICAgICAgIGl0ZW1zOgogICAgICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAgICAgIC0gZGVz
Y3JpcHRpb246IGZpcnN0IGl0ZW0KICAgICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogc2Vjb25k
IGl0ZW0KLS0tPjgtLS0KCnNjaGVtYXMvaTNjL2kzYy55YW1sOiBpZ25vcmluZywgZXJyb3IgaW4g
c2NoZW1hOiBwYXR0ZXJuUHJvcGVydGllczogQFswLTlhLWZdKyQ6IHByb3BlcnRpZXM6IHJlZwo8
cGF0aD4vaTNjLnlhbWw6IHBhdHRlcm5Qcm9wZXJ0aWVzOkBbMC05YS1mXSskOnByb3BlcnRpZXM6
cmVnOiAnYW55T2YnIGNvbmRpdGlvbmFsIGZhaWxlZCwgb25lIG11c3QgYmUgZml4ZWQ6CgknbWF4
SXRlbXMnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKCSdpdGVtcycgaXMgbm90IG9uZSBvZiBbJ21h
eEl0ZW1zJywgJ2Rlc2NyaXB0aW9uJywgJ2RlcHJlY2F0ZWQnXQoJJ2l0ZW1zJyBpcyBub3Qgb25l
IG9mIFsnZGVzY3JpcHRpb24nLCAnZGVwcmVjYXRlZCcsICdjb25zdCcsICdlbnVtJywgJ21pbmlt
dW0nLCAnbWF4aW11bScsICdkZWZhdWx0JywgJyRyZWYnXQoJPHBhdGg+L2kzYy55YW1sOiBwYXR0
ZXJuUHJvcGVydGllczpAWzAtOWEtZl0rJDpwcm9wZXJ0aWVzOnJlZzppdGVtczogJ29uZU9mJyBj
b25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgoJCVt7J2l0ZW1zJzogW3snZGVz
Y3JpcHRpb24nOiAnZmlyc3QgaXRlbSd9LCB7J2Rlc2NyaXB0aW9uJzogJ3NlY29uZCBpdGVtJ31d
fV0gaXMgbm90IG9mIHR5cGUgJ29iamVjdCcKCQknaXRlbXMnIGlzIG5vdCBvbmUgb2YgWydkZXNj
cmlwdGlvbicsICdkZXByZWNhdGVkJywgJ2NvbnN0JywgJ2VudW0nLCAnbWluaW11bScsICdtYXhp
bXVtJywgJ2RlZmF1bHQnLCAnJHJlZiddCgpJIHRyaWVkIGRlZmluaW5nIGEgcGhhbmRsZSBhcnJh
eSwgcGxheWluZyB3aXRoIHRoZSBkYXNoZXMsIHVzaW5nIGFsbE9mLAphZGRpbmcgbWF4SXRlbXMs
IG5vbmUgb2YgaXQgd29ya2VkIHNvIGZhciBzbyBhbnkgYWR2aWNlIHdpbGwgYmUgaGlnaGx5CmFw
cHJlY2lhdGVkIQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
