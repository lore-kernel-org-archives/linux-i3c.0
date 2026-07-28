Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE7C54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCx82YHfl6fiLJldFxH7P+dfO7upGUCb3KjfrAvThHY=; b=J3RMXvShU9qwcP
	fvozRWZ+kpftu1LOBi07SgSYcDHob0MNycR5Ad6nkx+RWLvxP6tcYVnSjIEWEHnmDFLdbvVyuNXzh
	g1IpDv9EowWJQWIllWSW2NLjeUGe5AN8eXo96e7Uu6Sb7HO21sOOs/KUqHbSjKavjW9Cck4DgxmXP
	saH0kG4vhzAlOCOAiXPngFkVaah8Fq/hN7qL0xRc2K1gOzOaxGtW6x+GZks6t2bDZEyhye8Z3FulZ
	2G7l8cJW+ahtNCoku0ZIV09z1jG1hFYHNL/cL6SVCrNYZFR1Eb5uJGbC0YZ4GOj8VpvfnSdRy3bDk
	n5OdUNJnM3fm+Jv35D6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocB5-00000004dSw-1X9Y;
	Tue, 28 Jul 2026 07:24:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocB3-00000004dSk-2S1V
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:24:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43BF54059F;
	Tue, 28 Jul 2026 07:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48091F000E9;
	Tue, 28 Jul 2026 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223477;
	bh=3JrtV3KN/UgQ91pgkMuzvCTjKjiM2JKJnuhw3hCQRFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jtlyvNMQ54dTMyJUSaIR9ykMsMCGc2xdgRGKBYeU1SlHLSZlgNCh9iXcf9XThnv8g
	 JHGu+2m5Wq9IL9J2ScsDypF33flGbHIF+0+HBth0YXtjgEVjLwWXX7eWL2jM/DVPhn
	 rKk+cJvW/KyBaTeJNxByc8YNOuikAg5K8MGI7zrxdesw9lt30RZyAftmH6ivlCn2As
	 0emVIExmTHlTZnqrS7YidbHJQS3tofGYsDQtwGhzv7+8g8YDQ2Qh7GUIRkOoMdcSjb
	 veJNCgHgMpSQisffnOn/gL8JPNYnoAz2r30RywpJM8/QGI/SWxsGhMROL42AP0uHJN
	 ZUeITt1/1j0uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260728065955.809445-13-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-13-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:24:36 +0000
Message-Id: <20260728072436.B48091F000E9@smtp.kernel.org>
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

PiBFbmFibGUgSTNDIHN1YnN5c3RlbSAoSTNDKSwgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFz
dGVyIGNvbnRyb2xsZXIKPiAoRFdfSTNDX01BU1RFUiksIGFuZCBTUEQ1MTE4IGh3bW9uIHRlbXBl
cmF0dXJlIHNlbnNvciAoU0VOU09SU19TUEQ1MTE4KQo+IGFzIG1vZHVsZXMuCj4gCj4gVGhlIE5W
SURJQSBWZXJhIENQVSB1c2VzIFNPQ0FNTSBMUEREUjVYIG1lbW9yeSBtb2R1bGUsIHdoaWNoIGNv
bnRhaW5zCj4gU1BENTExOCAoSkVERUMgSkVTRDMwMCkgY29tcGxpYW50IHRlbXBlcmF0dXJlIHNl
bnNvci4gVGhpcyBzZW5zb3IgaXMKPiBhY2Nlc3NpYmxlIG92ZXIgdGhlIEkzQyBidXMgdGhyb3Vn
aCB0aGUgRGVzaWduV2FyZSBJM0MgY29udHJvbGxlciBwcmVzZW50Cj4gb24gdGhlIFNvQy4gRW5h
YmxpbmcgdGhlc2UgY29uZmlncyBhbGxvd3MgbW9uaXRvcmluZyBtZW1vcnkgbW9kdWxlCj4gdGVt
cGVyYXR1cmVzIG9uIHBsYXRmb3JtcyBzdWNoIGFzIFZlcmEgUnViaW4uIFZlcmEgaXMgYW4gQUNQ
SS1iYXNlZAo+IHBsYXRmb3JtIGFuZCBkb2VzIG5vdCB1c2UgZGV2aWNlIHRyZWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFz
IHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQh
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNzI4MDY1OTU1LjgwOTQ0NS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xMgoK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
