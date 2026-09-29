Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06BCCA5FA7
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK8QlnWx5zXRtNnUoHzjKRatuhCqCxT+v/AEUgWj0HQ=; b=MOTdoY89DBB/Hy
	pq9kd5Hrn90CO86bBGhz1z5Gw0DKrxmUWvBR7Joj5ePFfxBryZ86RnfUB2Br9IF+rREPvNXJmcgEa
	Q5nZQHQ3AXgAoNasQzehDPaaTW2S7XTgjcbcWxlNwsAq6f9gENFuidnGyaElZIRkKh7auBLrZ53BP
	Hxv3dMBny9jAUfPY60Daogk9bx2PCJPJOFnaX02zHjUqYPwPZakhK45l0Z0yXxlsBy38jgnCHdyOz
	s8bIvzxlPCgd/KAegVGNelUTtVWSpnThmfdQrz8Z26ribsN499Z8EIfda6tcarC33+3yunkPFER+M
	scs6qJKq0Z8nOA/cuNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRVh-00000002Vxd-2RsP;
	Tue, 29 Sep 2026 06:40:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRVg-00000002VxJ-10ZN
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71AFF60A66;
	Tue, 29 Sep 2026 06:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB341F00893;
	Tue, 29 Sep 2026 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664015;
	bh=zjN1d6dtttPlAYmI0x+g48c72lkKBuMRCk+KaGCMxY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hno/16StrrEKs05bLoCBCRY3JJBCjtd5PhoxE/cIk4z7RFfvpPF3eM3cvauJp8DMm
	 be8D2eDacHq3VsaK+dOXEbrujcU6/iKxLc4mChftWqdyX4uMaN1GVG9GNc/fBwogvS
	 J8uqH9zZUQfJZMyI4YmLkOIqr80WyDXQmQjHmJR7HdyK1k4pyOLuJNv9Vx3j5aOLAq
	 d8vQ1sbHND5rIYySqapkY/oqav7eMq+FE1LAP8iQOPCN4NNNvrFg591HvE7tLlmili
	 ywCO2WBhg/IU5WOBUVXJE4bY+HbyGH8gT39CYKFNwOyhgYiuqe6kX3h7Y2lhZXzMLN
	 Gt8ux1++U1aiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/20] regulator: dt-bindings: sy8827n: support standard
 properties
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: linux-clk@vger.kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929061417.20733-19-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-19-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:40:14 +0000
Message-Id: <20260929064014.8FB341F00893@smtp.kernel.org>
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

PiBTdXBwb3J0IHN0YW5kYXJkIHByb3BlcnRpZXMgcmVndWxhdG9yLnlhbWwsIHN1Y2ggYXMKPiBy
ZWd1bGF0b3ItYWN0aXZlLWRpc2NoYXJnZScsICdyZWd1bGF0b3ItYWx3YXlzLW9uJywKPiAncmVn
dWxhdG9yLWJvb3Qtb24nLCAncmVndWxhdG9yLW1heC1taWNyb3ZvbHQnLAo+ICdyZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCcsICdyZWd1bGF0b3ItbmFtZScgYW5kIG9uLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmll
d2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwub3JnP3BhcnQ9MTgKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
