Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2EACD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JOAAgw7o4A3Br0kPNFhw5M8BJd/fHVQH0kkyiJJHnsU=; b=l4HguZ/bwTvDsu
	gNaCs9lKObKCf036E3fxXZ8u/lm0o9S9WaDxqhGQ9HEweAE/6AmQCTF8AVyv6C3kwHf6LrJxM7ECp
	cqj068tUdG4raN9lAxln004GINHzLOSQjZl+XdEyuOSYeyrfmehere7n+IrMWkLXL5xW94fttJI15
	0CDotm+1MTDtebgW81nsjYo2exQg7cL+KCZCe/SZ7KY853lMBIJO0Ct8A4s9m8DVXsL4bRjrt6vmi
	oc1/+KPOxZsKnr0afcT8fL843FgPZl5lj4p13mUWsm24BmF4wqHzDdmR7cTAIU+q23nr2WGXbX6G9
	4/Eh3idzWIV+2uyXf+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYV5-0000000C7q7-1gDc;
	Fri, 22 May 2026 22:37:51 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYV2-0000000C7pO-0iWK
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 22:37:49 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-65e170f1ca5so8151112d50.0
        for <linux-i3c@lists.infradead.org>; Fri, 22 May 2026 15:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779489466; cv=none;
        d=google.com; s=arc-20240605;
        b=ipEFJdxRLrc/j6x5ZtDfd2AQ0Im5l/0iEZSg+xFjb/5SzKPMuYz/7bKoenT791Kx3m
         EUXx91aEUdezTIGALuoMIyVIJzaJQQnnawgZJkdlTSOuBRDwuYqE587RBpeSGdLS63kF
         aAz0a0xx1ZkOY8xL9AwvcCV0qVMM7mA98h3TjxPCHTWf66qhIbZrc7lanPRaKLr3Ws9w
         i8fWUM08EVL9m+RHbNj9YB+clTCBrOtcythSTY+TayQyozSO/FszNYh/CDE81o9CY4Vo
         IpjPVv70SBQoPQYqhYDWxYEIKNSnBx6xpMLNqH0kTt3rOQmLuaqGaImLDy5HkGhBoW1z
         RYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OcpquamQtyWzkbzZAyyVGg3XOXnJ1GoeBunc1s7raSE=;
        fh=CAmx8MF9kKtixl6Djb2FwHwlkyXIL1VAJYjLdW57lxU=;
        b=Zp0Y3bcafWBd5SJwDNTssQOpsABrQuz8ZtSL9P2KUisxghEeDVET/Frx7bZCbMOHRU
         1r3RKOfAruNyLz1czOFpGSlmq3pV6GBqcDC0L5xERJvrVxR6pbB0DzVxfMaKJ8a/7V57
         oIYen2SAYkyK5czkuYUAnyGLYd91QRECU+byWk9rQpRqLEJZ30OJmN3G+fIyeAWMYBfu
         +0Sz7+7v6XBr5BjexkTw5ECXiHHtY5fQTireiiyrFfnuKtCHRvhcl1ebIaf8hT61QPlh
         d7Osc732hpyQapYH5Elby2+r1tWhzCjW03Ub/cZ7D/m5NdCqT3T/EY9o9cQqeoMiU228
         vCVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779489466; x=1780094266; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OcpquamQtyWzkbzZAyyVGg3XOXnJ1GoeBunc1s7raSE=;
        b=ZhMu2XFwx9VMzSHUarY45o7Cxt6PISVSHHbvKfvv13YhH+oNIB734PHGN3KKt7XBIx
         52NPuz6ksRc1v3hYt6PATwgzi9iBoBzHetQH0xFMWIdXXYVsi4Ja8NFLkpNQxbh8rN+i
         PZEz3rbnDPwof8+d0bxkeJA2YYLzVY7FVQCKeokHlhAt2083sNOG8wDkVjG4BMl3R0Iy
         ymNgB/QwjjRUsCaa45sDjasA+fNR5kOUGrHlkmc5k3FZzZRIwubHWK49Mu7rYNEylJ7o
         zm6yLX9HshsUcgK8NFluNSU2k5tg++e9K6W4mz0HxxjRQsgvYS/jY2wbfjUFPQu9Omg8
         q1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779489466; x=1780094266;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcpquamQtyWzkbzZAyyVGg3XOXnJ1GoeBunc1s7raSE=;
        b=R3dm7qsk8K9Wz6eB7RpoR5w6Q2rzn5OvzH4WlX9ONDD9YQ6OVVYninvvHbblrj/YSf
         ayDjqO+ugOGe1ZpW3EKDKVWhUNX17jYgjnXfzmEhoA3QL4OCdHHFIAE4PVn7R2vowU4+
         IafAOn05MUUi7OF5ElVzjhkZdI5hbLNakxhneElW7S4CcBMF9SeW3cOA8Sq9KEIGMfmq
         ojgedIAv5+fdF3AqHtKI2zlY2ql9XM0HALi1gS0h5hNnOb4q4JFN7K4usPCxRgU78QV1
         xKbj7vHtn+hBjiZ+EItTwZoqN1xMfS9mzV4ovfZnoHmiVWGSeqPI2DdanMm+zSyph9lA
         mWlw==
X-Gm-Message-State: AOJu0YzcQKRAJeyNA0wORq08018ienaRqeWKKAeNYQ9fHBQhQsQ3JFC/
	G03s2XufDatC3OxzXOx9z3/2kDizsNmoxEp60PclwysIxJagxi8DpVHRXFaINhrD4qeCF5Mghkq
	KKb7mgTpuSDl0omDUEsXVe1DxWZ7Djr5kEFHfksbh8cw3FgZ8KcECq0djgOs=
X-Gm-Gg: Acq92OEmURPoON2WHnVDBEQQ1HmjqCNJhz4bPMawHQaNm5I8GDQwxTNwTY99mTMXRnW
	A2dPjJgIxOmjBKXdHoCOBZKwrX6IT4adY8/kFGN8vUP5jNml7UVreCgVmGWB1NWJOwzVImrmuM/
	qyNU7w3KjIRTQU/lINqesFEoVD14mCZBHzlNksUZpMvqhNOdg/FxVYMsLP7UFZWMlcFkSBYWaq/
	pYchll6Kt8SVaDdzEgLidGLz4O49s0VKN38G8cGiznmHP7vtdBPDkaDakpuQc+SUgdYS0SL6nvs
	I8c9rnyZ/CCbcgRu4B1/uGy6+8U=
X-Received: by 2002:a53:b1c3:0:b0:65c:2b92:f8de with SMTP id
 956f58d0204a3-65ec9808584mr4581067d50.28.1779489465671; Fri, 22 May 2026
 15:37:45 -0700 (PDT)
MIME-Version: 1.0
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 22 May 2026 15:37:35 -0700
X-Gm-Features: AVHnY4LQGa4q9Tu9nBqM7XdtYWTul5hLBD129mAO2wEN7fnsiQUEUGSGYc6gkJQ
Message-ID: <CAHreonE1UF=BJjeQH_i0jjAEMBb8OALeTKoxPBcrRwLZWq=p0w@mail.gmail.com>
Subject: [RFC] mipi-i3c-hci: Support for DMA Ring Pipelining / High-throughput Streaming
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com, npitre@baylibre.com, Frank.Li@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_153748_213589_6122FD3B 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello all,

I am working on a project using the mipi-i3c-hci driver that involves
large packet bursts (exceeding the physical hardware DMA ring size,
such as large MCTP-over-I3C payloads).

I noticed that the current driver implementation treats these as
discrete batches.

I am considering implementing a ring pipelining or DMA streaming
mechanism to allow for asynchronous refills while the ring is running.
This would leverage the
standard ENQ_PTR doorbell mechanism (per MIPI HCI v1.2, Section 6.8.2)
to continuously feed the hardware. I figured in that case it may be
worth while to see how the upstream community feels about this
feature.

Before I dive into the implementation for upstream, I wanted to check:
1. Is there any existing work or a roadmap for DMA
streaming/pipelining in the HCI driver?
2. Is a generic dma streaming mechanism for large transfers something
you would be interested in seeing as a contribution to the mainline
driver?

Currently, my proof-of-concept handles the pipelining at the core
transfer level, but I
suspect for a generic upstream implementation, this sliding window
logic should be moved into dma.c to properly support controllers with
multiple Ring Bundles.

I would appreciate any thoughts on this approach or the preferred
architectural placement.

Best regards,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
