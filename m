Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB858CD98CF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VB30rtJpcdWBkSfUltG7JO/Quqnck+I6SLFAjV+j994=; b=n1cSjS1bDjbXnF
	Ac6RRZwaMtWqwIxi5rnEG+oQSCGYliACacgU1Uhafju2IF7L5DDJz1EyXN3ysdLtaP2+rIddGLfEk
	6u94OF1BGalncrK6oVDPvEC9Gw67gz+ftPZ2m2L1sRuMhA29v4gPEi3TA4+JP2KDj91Eg8xS+U8tC
	0frXsfuAACFcvAPpZrOXPsNv9sFSXCCNQWmla2PVRGmfXmngtdtpDABZzGT33KLV4ccboQ82fkPiI
	jntgvC+bFE0VDVq9+F0VrcH3A9g/RCSEyE1aE6OvrJ7KDCk0eJA9K10mTZyoVOyD70a4hQiihGD0U
	AsPLNh3B15jWCWoPvi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZR4M-0000000Fbyo-21Vq;
	Tue, 16 Jun 2026 10:30:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZR4L-0000000Fbyi-2Uef
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 035CB43832;
	Tue, 16 Jun 2026 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6161F00A3D;
	Tue, 16 Jun 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605856;
	bh=FwC59B4n0rf5OGJgDzl9cyHnls6ke/WWYBAyLmv+7gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0phtaJn/lZL+Gaioo/8scIgU1c0Y5hrikbqp9MQK7l2HUt6tS0inRk4Ir6u9u+aP
	 5WqqB0/f9ttMvqFTZV8rebA911Su7EDHqbNe6tM7GX0GErN8sshLvTbsvjDRAqs3sP
	 7yHElXO1GdySkuqT+gGcys1kURHh/DLkK0GXM/V4ZQ68ltgnz4swwM5sOXatVH7psy
	 xnRHCd3enQkBUVVt86R5GM8Pwc60OPyE7l574leThLexMTrJvmRknvMG1zP58OSbXY
	 PZyWFcXhaKaVLUv19c+aTNo3xQlxfwiFZ+IOTkt5mLPC7giQbu4McI+SobGucc2Utw
	 yaQsM79qQfDvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] hwmon: spd5118: Add I3C support
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:30:55 +0000
Message-Id: <20260616103056.6F6161F00A3D@smtp.kernel.org>
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
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxNjA5NTQyOS4zOTQ3MjA1LTEtYWtoaWxy
YWplZXZAbnZpZGlhLmNvbT9wYXJ0PTExCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
