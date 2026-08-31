Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BBBC624C6
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Aug 2026 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Iczh7dfdTYa+u4w556jNS7mrSwhvkZIubkz6WaLGZs=; b=LmKuDodF4j9HXS
	v+NC6SoxnHYc4S+6FeXPMw3O48q+penhpKFPSs3nLY3RsTe2kIy97DFO0MJNxfdwzVHtLPUL5g6DS
	GTLziUwWypetQ4gSjvL4rZUcibSStakXV7sVUj2sPfmd5lVySP+bC74xTKbEc5rXZv1dQcvFLxDcf
	E8Vrn+ugOpBNhfbWILbUGNRXlZ+EDuMmJ1VbmEtb2r3+cAnNArPphbQK4EyezcGyS5atAwsLTlXQD
	Tj4va0XWMlXYpS6goqgy9NwW4uo8zhFNCqdrFMVsLWwPpNYWihuG2decAp8i1knJ7hjy2gyI8lIxU
	El0BoetKmBufmymN8BmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15zZ-0000000ADJS-3mJu;
	Mon, 31 Aug 2026 17:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15zZ-0000000ADJ8-18ka
	for linux-i3c@lists.infradead.org;
	Mon, 31 Aug 2026 17:40:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C97014019C;
	Mon, 31 Aug 2026 17:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6033B1F000E9;
	Mon, 31 Aug 2026 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198020;
	bh=26BF7/QGqh5Yc3HSL4QwvYiIw/xmbbyhjQI8a5/gRFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NiEszkvczRW95ILt+5FqPNAXNjkBkoK0rMehGADLlmFsyr8itBcvt7WmCHAv3fI6/
	 6TM/5hnvezO6JZy2yORK/OAraubV8JBOJs0wB2FHCopseLeLuB0zPdPTn/kFumOYpF
	 zQRkQxN4FWZu1zgq8jQjVX5SkVFCcWaEdzMkWVxg5DJ/6T1koXBlqfsTNXdJJVHliT
	 MmM0gkj9oXFBpKlvl7nKA0rYxQggHVrwLxM3dKoaxtX+5hvLzv01vtby+rp3dvx1eL
	 RITUcdPJeQe3gZqJRC5Pl3ywR9BIGOUYucMOYt2DZYYmCUao6e2UsWBYvT4WMQVQxS
	 ihzWOJryK7Brg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] i3c: master: svc: Prevent IRQ storm from
 false SLVSTART on NPCM845
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260831133314.4125787-647-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-647-sashal@kernel.org>
Date: Mon, 31 Aug 2026 17:40:19 +0000
Message-Id: <20260831174020.6033B1F000E9@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBJbmNvbnNpc3RlbnQgdXNlIG9mIEkvTyBhY2Nlc3NvcnMgZm9yIEZJRk8gYWNjZXNz
ZXMsIG1peGluZyBzdHJlYW0gYW5kIHJlZ2lzdGVyIGFjY2Vzc29ycywgd2hpY2ggY2F1c2VzIGRh
dGEgY29ycnVwdGlvbiBvbiBiaWctZW5kaWFuIHN5c3RlbXMuCi0tCgpjb21taXQgYzI4MmU5MmY0
YjkzZmJhNGM4NTRkNWU5YzM0YzFhYzEwMjEyODExZgpBdXRob3I6IFN0YW5sZXkgQ2h1IDx5c2No
dUBudXZvdG9uLmNvbT4KCiAgICBpM2M6IG1hc3Rlcjogc3ZjOiBQcmV2ZW50IElSUSBzdG9ybSBm
cm9tIGZhbHNlIFNMVlNUQVJUIG9uIE5QQ004NDUKClRoaXMgY29tbWl0IGFkZHMgYSBoYXJkd2Fy
ZSBxdWlyayB3b3JrYXJvdW5kIGZvciB0aGUgTlBDTTg0NSBjb250cm9sbGVyLgpJdCBleHBsaWNp
dGx5IGNsZWFycyB0aGUgU0xWU1RBUlQgc3RhdHVzIGJpdCBhZnRlciBlbWl0dGluZyBhIFNUT1AK
Y29uZGl0aW9uIGluIHRoZSBNYXN0ZXIgUmVxdWVzdCBJQkkgaGFuZGxlciB0byBwcmV2ZW50IGFu
IElSUSBzdG9ybSBjYXVzZWQKYnkgYSBzcHVyaW91cyBTTFZTVEFSVC4KCkxpbms6IGh0dHBzOi8v
cGF0Y2gubXNnaWQubGluay8yMDI2MDQxMzAwNTA0MC4xMjExMTA3LTMteXNjaHVAbnV2b3Rvbi5j
b20KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCA5NjQxZTY2YTRlNWYy
Li5lNzRiMjJjNmY4MDhjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKClsg
Li4uIF0KCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRo
aXMgcGF0Y2gsIGJ1dCB0aGVyZSBpcyBhIHByZS1leGlzdGluZwppc3N1ZSBpbiB0aGlzIGZpbGUg
cmVnYXJkaW5nIEkvTyBhY2Nlc3NvcnMgZm9yIEZJRk8gcmVnaXN0ZXJzLgoKSW4gc3ZjX2kzY19t
YXN0ZXJfeGZlcigpLCBkb2VzIHRoaXMgY29kZSBtaXggYSBzdHJlYW0gYWNjZXNzb3IgKHdyaXRl
c2IpCmZvciBidWxrIGRhdGEgd2l0aCBhIHJlZ2lzdGVyIGFjY2Vzc29yICh3cml0ZWwpIGZvciB0
aGUgZmluYWwgYnl0ZSBvbiB0aGUKc2FtZSBGSUZPPwoKZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmM6c3ZjX2kzY19tYXN0ZXJfeGZlcigpIHsKICAgIC4uLgogICAgd3JpdGVzYiht
YXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01XREFUQUIxLCBvdXQsIGxlbiAtIDEpOwogICAgLyogTWFy
ayBFTkQgYml0IGlmIHRoaXMgaXMgdGhlIGxhc3QgYnl0ZSAqLwogICAgd3JpdGVsKG91dFtsZW4g
LSAxXSB8IGVuZCwgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NV0RBVEFCKTsKICAgIC4uLgp9CgpV
c2luZyB3cml0ZWwoKSBmb3IgdGhlIHJlbWFpbmRlciBieXRlIHBlcmZvcm1zIHVud2FudGVkIGJ5
dGUtc3dhcHBpbmcgb24KYmlnLWVuZGlhbiBwbGF0Zm9ybXMsIHdoaWNoIGNhbiBjb3JydXB0IHRo
ZSBkYXRhIHNlbnQgb24gdGhlIEkzQyBidXMuCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYWxz
byBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvIHRoZSByZWFkbCgpIGNhbGxzIGluCnN2Y19p
M2NfbWFzdGVyX3JlYWQoKSBhbmQgc3ZjX2kzY19tYXN0ZXJfcmVhZGIoKSBwZXJmb3JtIGluY29y
cmVjdApieXRlc3dhcHBpbmcgd2hlbiByZWFkaW5nIGZyb20gdGhlIE1SREFUQUIgRklGTz8KCmRy
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jOnN2Y19pM2NfbWFzdGVyX2hhbmRsZV9p
YmkoKSB7CiAgICAuLi4KICAgIHJlYWRzYihtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01SREFUQUIs
IGJ1ZiwgY291bnQpOwogICAgLi4uCn0KCmRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jOnN2Y19pM2NfbWFzdGVyX3JlYWQoKSB7CiAgICAuLi4KICAgIGluW29mZnNldCArIGldID0g
cmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCKTsKICAgIC4uLgp9Cgpkcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYzpzdmNfaTNjX21hc3Rlcl9yZWFkYigpIHsKICAg
IC4uLgogICAgZHN0W2ldID0gcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCKTsK
ICAgIC4uLgp9CgpTaW5jZSByZWFkc2IoKSBpcyB1c2VkIGluIHN2Y19pM2NfbWFzdGVyX2hhbmRs
ZV9pYmkoKSBmb3IgdGhlIHNhbWUKTVJEQVRBQiBGSUZPLCB1c2luZyByZWFkbCgpIHRvIHJlYWQg
aW5kaXZpZHVhbCBieXRlcyBpbnRvIGEgdTggYnVmZmVyIGluCm90aGVyIGZ1bmN0aW9ucyBjb3Vs
ZCByZXN1bHQgaW4gY29ycnVwdGVkIGRhdGEgb24gYmlnLWVuZGlhbiBzeXN0ZW1zLgoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgz
MTEzMzMxNC40MTI1Nzg3LTY0Ny1zYXNoYWxAa2VybmVsLm9yZz9wYXJ0PTEKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
