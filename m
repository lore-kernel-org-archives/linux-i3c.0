Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C469BC4332F
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp/kPqvcZ7EH/ksRg/huOGLDQftyfXHjlnxnzpdTbzI=; b=SweknaLtjz6t/I
	AZfJtns+t4JJsr0/aqRuMePftR/5lclZpNB5CAgWQ/OMCsMyPpTFvBJSlhm0axkkKVP0TIvjJNl2m
	TtVC77zMhbO0L0Kf7CrGKuTF6MehBjcGFVpZN4stbN6N2CJEvWd7jLAg0lC6nrzsSXw9CgAFbw6iK
	/Ko2S6dsb3mb5NmzMxkVNjrvIL5YhTWHU1lwpw6v0DFZoWzpYXTOzZ27Hi3sxhvvr5dJgNoh3IoOk
	LBrUg9DGzO10fwlDoFxRjULX6Zpqpd6ae6KlkxPalt26w2OxMnMBeqMcWDR0FonQM6AW2VEqzQjBS
	LQ1WkvHzs/FHProuXXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pEz-00FRCq-1L;
	Tue, 14 Nov 2023 08:57:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pEw-00FRBk-0K
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 08:57:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A48DC0012;
	Tue, 14 Nov 2023 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699952262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y71DTRYYjD5Pmt7mctLPg7jTQX9GlbAgtEg/Aq82o78=;
	b=PPXqcFWc7sokc1zQQ/M/kGX7QfiWYc+R9bfOUgm/uoUr8MyK8IlBaL7CTYfpzHWLy+gcei
	INEBh8LdFr6Zz7LKSlu5ZyDbdiOcGXusTWz/JEGUEdmFDMV12Ci99sPcr1SL0NdShbwinJ
	Jm3rygUvemq8+M1eSXrdOWiHiLPg+WNSPiWGTj1uXRanfzx2CB74ytN10hbpg1KhIEfuu0
	ls4Muy5Q1qXvZjO6IRbtsuGK1jjP0UUcbTHShrRYjQ3AoUwn1C662S7bTpG0ZcwW4FuL/K
	/lm2Zjy5+0UsKl85foPSblGx5pI8OH5E5NZ79frx/PRYIgdzsdZkLM5TLi4AGg==
Date: Tue, 14 Nov 2023 09:57:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] i3c: Add fallback method for GETMXDS CCC
Message-ID: <20231114095737.158781d1@xps-13>
In-Reply-To: <20231114085525.6271-2-joshua.yeong@starfivetech.com>
References: <20231114085525.6271-1-joshua.yeong@starfivetech.com>
	<20231114085525.6271-2-joshua.yeong@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_005746_271975_A9ACDCC6 
X-CRM114-Status: UNSURE (   8.56  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gVHVlLCAx
NCBOb3YgMjAyMyAxNjo1NToyNSArMDgwMDoKCj4gU29tZSBJM0MgaGFyZHdhcmUgd2lsbCByZXBv
cnQgZXJyb3Igd2hlbiBhbiBpbmNvcnJlY3QgbGVuZ3RoIGlzIHJlY2VpdmVkIGZyb20KPiBkZXZp
Y2UuIEdFVE1YRFMgQ0NDIGFyZSBhdmFpbGFibGUgaW4gMiBmb3JtYXRzOiB3aXRob3V0IHR1cm5h
cm91bmQgdGltZSAoZm9ybWF0Cj4gMSkgYW5kIHdpdGggdHVybmFyb3VuZCB0aW1lIChmb3JtYXQg
MikuIFRoZXJlIGlzIG5vIG1lY2hhbmljcyB0byBkZXRlcm1pbmUgd2hpY2gKPiBmb3JtYXQgaXMg
c3VwcG9ydGVkIGJ5IGRldmljZS4gU28gaW4gY2FzZSBzZW5kaW5nIEdFVE1YRFMgQ0NDIGZvcm1h
dCAyIHJlc3VsdGVkCj4gaW4gYSBmYWlsdXJlLCB0cnkgc2VuZGluZyBHRVRNWERTIENDQyBmb3Jt
YXQgMSBpbnN0ZWFkLgo+IAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+Cj4gLS0tCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
