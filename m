Return-Path: <SRS0=till=GV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDFDC433DB
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Jan 2021 17:21:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F084122C9E
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Jan 2021 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F084122C9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KYx8IXu6Q2IhA8e7pSDOG9x3VRlO5Z/1Utf5MJqyyo=; b=GuEBpKDNWjFYJM3UtTlXN+dwS
	34DaMmf59C5VwtI7Wf3FNM1VENh6LZwq8c3DNvMNXfJVtspFKrzTNTyl+NqJRbJHIaYMNvuWQ5OpJ
	pTQp9UIwFfh3SKBbOtwYhUTf/UkIqdpLs7SrFVbr1b+8voJ63CdAi1xhMwSVJTlEzlr/92cRJvNKo
	c05VUp83dQLEX7B058JzXyd2MnFsLeBk2hUlB+IhH5rQ1CxSTEzm25UHrhpB5rLoEVaqYnmHK04Wu
	Ti9cQIc7TkIayQ55p/c88fO1yUZUP+3U8PXXV0j8HEuFK3e+sm5AHq2+XakZuhJhGEQy3TmIpK5FI
	KK/UoWcaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1YDW-00022t-TB; Mon, 18 Jan 2021 17:21:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1YDU-000229-4C
 for linux-i3c@lists.infradead.org; Mon, 18 Jan 2021 17:21:25 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EB838FF806;
 Mon, 18 Jan 2021 17:21:18 +0000 (UTC)
Date: Mon, 18 Jan 2021 18:21:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: i3c: Convert controller description
 to yaml
Message-ID: <20210118182117.311feb44@xps13>
In-Reply-To: <20210115170312.GA1434283@robh.at.kernel.org>
References: <20210114175558.17097-1-miquel.raynal@bootlin.com>
 <20210114175558.17097-2-miquel.raynal@bootlin.com>
 <20210115170312.GA1434283@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_122124_258127_2B3847B6 
X-CRM114-Status: UNSURE (   9.41  )
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

SGkgUm9iLAoKSnVzdCBhbm90aGVyIHF1ZXN0aW9uLgoKPiA+ICtwYXR0ZXJuUHJvcGVydGllczoK
PiA+ICsgICJeLipAWzAtOWEtZl0rJCI6ICAKPiAKPiBZb3UgY2FuIGRyb3AgJ14uKic6Cj4gCj4g
IkBbMC05YS1mXSskIgoKSGVyZSB5b3UgYWR2aXNlIHRvIGRyb3AgdGhlIGJlZ2lubmluZyArIHdp
bGRjYXJkIG9mIHRoZSByZWdleCBtYXRjaGluZwpmb3IgSTJDIGNoaWxkcmVuLCB3aGljaCBpbmRl
ZWQgbWFrZXMgc2Vuc2UgdG8gbWUuCgpbLi4uXQoKPiA+ICsgICJeLipAWzAtOWEtZl0rLFswLTlh
LWZdKyQiOgoKTGF0ZXIgaW4gdGhlIGZpbGUsIHdlIHVzZSBhbm90aGVyIHJlZ2V4IHRvIG1hdGNo
IEkzQyBkZXZpY2VzLiBCdXQgaGVyZQppZiBJIGRyb3AgXi4qIGZyb20gdGhlIHJlZ2V4LCBJIGdl
dCB0aGUgZm9sbG93aW5nIGVycm9yOgoKc2NoZW1hcy9pM2MvaTNjLnlhbWw6IGlnbm9yaW5nLCBl
cnJvciBpbiBzY2hlbWE6IHBhdHRlcm5Qcm9wZXJ0aWVzOiBAWzAtOWEtZl0rLFswLTlhLWZdKyQK
PHBhdGg+L2kzYy55YW1sOiBwYXR0ZXJuUHJvcGVydGllczpAWzAtOWEtZl0rLFswLTlhLWZdKyQ6
ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKCUFkZGl0aW9u
YWwgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdwcm9wZXJ0aWVzJywgJ3JlcXVpcmVkJyB3
ZXJlIHVuZXhwZWN0ZWQpCgk8cGF0aD4vaTNjLnlhbWw6IHBhdHRlcm5Qcm9wZXJ0aWVzOkBbMC05
YS1mXSssWzAtOWEtZl0rJDogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJl
IGZpeGVkOgoJCSdlbnVtJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5CgkJJ2NvbnN0JyBpcyBhIHJl
cXVpcmVkIHByb3BlcnR5CglBZGRpdGlvbmFsIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgn
cHJvcGVydGllcycsICdyZXF1aXJlZCcsICd0eXBlJyB3ZXJlIHVuZXhwZWN0ZWQpCgk8cGF0aD4v
aTNjLnlhbWw6IHBhdHRlcm5Qcm9wZXJ0aWVzOkBbMC05YS1mXSssWzAtOWEtZl0rJDogJ29uZU9m
JyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgoJCSckcmVmJyBpcyBhIHJl
cXVpcmVkIHByb3BlcnR5CgkJJ2FsbE9mJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5CgknYm9vbGVh
bicgd2FzIGV4cGVjdGVkCgpJIGNhbiBrZWVwIHRoaXMgZXh0cmEgIl4uKiIgYnV0IEkgd291bGQg
bGlrZSB0byB1bmRlcnN0YW5kIHRoZSBlcnJvcgpiZXR0ZXIgYmVjYXVzZSB0aGlzIGRvZXMgbm90
IGxvb2sgcmlnaHQuCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
