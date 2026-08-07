Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25467C2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbgxLN8cpiPHg8aap7olYe8iyVkA2+krA1tH45Twt2s=; b=usDThAivKKt7UR
	teRyQlykPHNqOp2uhMmIFZF0PBHGqg9rGtCS4fxTYBZhDImKekn487LegiUeHSMSkzbXbKHHngoM7
	h7f4WwECou5C7wlCoyJUtnSyh5mWkvgoT+b/TfKH36uY+idx1JKKaA/0MdZ8Sm8ufAQIqffNuCgcf
	9Cdf4iCp7lP3wlrn9y/sVzmyFkmyKA/Vn29UKsu7Cy081uHQmSeZNgZct0iQtsOXgS3tHoMeY0+W2
	U/X9G5eVRQFPyaD0JlNSeAlJjr0NOJ90uH70gvH0JOepgFVDH3tqC01XcVYSYMHN9lrD5ft5fWwqN
	KyWf2egdv7E7kZYjpS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMOM-00000008KYK-32PW;
	Fri, 07 Aug 2026 15:21:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMOK-00000008KYE-3eNO
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:21:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 531DB60103;
	Fri,  7 Aug 2026 15:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D771F00A3E;
	Fri,  7 Aug 2026 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116108;
	bh=9UFnAGYA40r/sjm4+73oibOIiWSY0H2QZyMR8VUTKVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PAakdwXBr+EzIwVBMmoGv+9NSvAVdVk7HecUQjwmAuVZvWYrhXaZ6NrPe9eRGbGlS
	 g2pTf+9UI3EPgb0MaBDbPiM4sGWWDgHXCbMT4bOgirUJXLXf2q0W014c1W40FaxFpO
	 G9AD3aDAUFK7guKKpT40n9js3y+GN7u3ojdiUPsqRJnrAVG6D9o07rR9Wy8Gxu6tzm
	 hceGjaTSMnhzKZjLRdy0lxUfBMDeRZsxAeyrUps/r1rzAhIpWKjJB227PgemIU81jL
	 IgBHnPlDGKkMURFltfK2hA3u1rnXZdpYL4dtpV1nW065CTg6ftwGPRL0292HPl4OQc
	 reMr+HMTnW/0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 10/14] i3c: master: Add helper to query bus wakeup
 requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260807145638.168865-11-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-11-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:21:47 +0000
Message-Id: <20260807152147.C8D771F00A3E@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBBZGQgaTNjX21hc3Rlcl9oYXNfd2FrZXVwX2VuYWJsZWRfZGV2cygpLCB3aGljaCBpdGVyYXRl
cyBvdmVyIHRoZSBkZXZpY2VzCj4gb24gYW4gSTNDIGJ1cyBhbmQgcmVwb3J0cyB3aGV0aGVyIGFu
eSBvZiB0aGVtIGFyZSBlbmFibGVkIGZvciBzeXN0ZW0KPiB3YWtldXAgYW5kIGhhdmUgSUJJIGVu
YWJsZWQuCj4gCj4gQ29udHJvbGxlciBkcml2ZXJzIGNhbiB1c2UgdGhpcyBoZWxwZXIgdG8gZGV0
ZXJtaW5lIHdoZXRoZXIgd2FrZXVwCj4gc3VwcG9ydCBtdXN0IHJlbWFpbiBhdmFpbGFibGUgd2hp
bGUgdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1
bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlz
IHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNzE0NTYz
OC4xNjg4NjUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEwCgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
