Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051BDCDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcHsMoeVj94bpMD3nZFrXiq5JKc8JsgDm2NDQ4z09BU=; b=F/lPNd+gvNt8My
	eN0dgiwvpUQIC/ccwPnI5EVp9mz1dcNjQAvtjRpgKbucPqcwkDydzlGzqncBJNDUEUYRZOIA1rJkY
	0/RyiLm5OhEEVbWYD7v/RTBnRf7N4xJRMKlDuLeolbCdwbh5kdQaTjSo75QurkyBBZ1hEA9SoV0Dp
	gHljVNA2+W3ZdDOLRSN+JTn4dMa470+HmuioW6GdqG5hza2iQF3+bYHQhYGpYLsxqDdOI32Gr+f5S
	YzAvcBgYK6qDYfN5U+2qnWrqG61sQ51oRqDbrkvKlhNX7NY3heo0Cga9/IbWdEBIkQ9Cn07vxDEea
	iE/vuOqfr5nEWJaKtrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLAY-00000007dKa-2em5;
	Wed, 24 Jun 2026 10:49:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLAW-00000007dKT-0sR6
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:49:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3FE360018;
	Wed, 24 Jun 2026 10:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C1F1F000E9;
	Wed, 24 Jun 2026 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782298159;
	bh=N1wcvNlV7wus0UKNanavi25TVCxydBp7LLuxwb6HvsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/OE/u1tJu8B3NTtzTxIW1HPOcRHOqkR5hCrvjl4lWsffmOF9xtRPsNl5kk7YOzGU
	 8nqeyivqYbn7gb8jTEFfuazXmrSkeoMKS/l2RlVa+zJE+WcHrTV2QbBV9gH65hIFdT
	 PmnRnTDojbYEiR0z2FKnD7UFggXQFFgY63bOyQHM39couup5OPw5pBTZVfaKsDEkb9
	 HL4FS+9eHTvCgavMZdOq5drKHhEQNx6sGF5A60ajSOzhBbjcME1zG4dX1vcfKB6m77
	 sEJQrKvO8oMfdu9OXqFN13SQsC+u6SPiflEP09G9G18om5xtsuhFTG/QSB49i5vhTM
	 TVT8MRrArXCIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] hwmon: spd5118: Add I3C support
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624102153.1770072-12-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-12-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:49:18 +0000
Message-Id: <20260624104919.14C1F1F000E9@smtp.kernel.org>
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

PiBBZGQgYSByZWdtYXAgY29uZmlnIGFuZCBhIHByb2JlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgSTND
LWJhc2VkCj4gY29tbXVuaWNhdGlvbiB3aXRoIFNQRDUxMTggZGV2aWNlcy4KPiAKPiBPbiBhbiBJ
M0MgYnVzLCBTUEQ1MTE4IGRldmljZXMgYXJlIGVudW1lcmF0ZWQgdmlhIFNFVEFBU0EgYW5kIGFs
d2F5cwo+IHJlcXVpcmUgYW4gQUNQSSBvciBkZXZpY2UgdHJlZSBlbnRyeS4gRGV2aWNlIG1hdGNo
aW5nIGlzIGhlbmNlIHRocm91Z2gKPiB0aGUgT0YgbWF0Y2ggdGFibGVzIG9ubHkgYW5kIGRvZXMg
bm90IG5lZWQgYW4gSTNDIGNsYXNzIG1hdGNoIHRhYmxlLiBUaGUKPiBkZXZpY2UgaWRlbnRpdHkg
aXMgdmVyaWZpZWQgaW4gdGhlIHR5cGUgcmVnaXN0ZXJzIGJlZm9yZSBwcm9jZWVkaW5nIHRvCj4g
dGhlIGNvbW1vbiBwcm9iZSBmdW5jdGlvbi4KPiAKPiBBY2tlZC1ieTogR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2
QG52aWRpYS5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBu
byBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYyNDEwMjE1My4xNzcwMDcyLTEtYWtoaWxy
YWplZXZAbnZpZGlhLmNvbT9wYXJ0PTExCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
