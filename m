Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626D606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Oct 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r7lAgtIh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dGfWP/SA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWtk7kEeZV53JUJ7MllrpwTI5ifEfuuD8W535MlsG2Y=; b=r7lAgtIhWe4QBD
	6Na6MphU4vVJRXCfc7et68mJ6YUkWTWJLES90eoypyA9jbD1fFBS8s1e+ylRGule2QQs2ZcBanzIF
	j57R7vchFCx/bybheCNPVS3k3btmTc2VR1M63yZbndhpWef30niBw3G7IKbpxm8try2EO8YTl1oyG
	pi5HUQ78vlNzAowd3XerJX6jsJGvaFZszziSQsDemktlywbzD1D3pQdlma8gcMID2U8AKjfau7Swq
	zVkUgwfkLJYGwap8l17C4bxQGnee1Od75PPrSH7z9twzMw+bxtWKUaT9OtneWUeW5gsURivlJhuvG
	YVGNBz5ZnTwM/YY5bosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY0V-0000000CDcM-0t6c;
	Wed, 21 Oct 2026 15:13:35 +0000
Received: from mail-norwayeastazon11013005.outbound.protection.outlook.com ([40.107.159.5] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY0R-0000000CDbm-2K4F
	for linux-i3c@lists.infradead.org;
	Wed, 21 Oct 2026 15:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytqV+2F6DCU04fW7c5iDqu2+BkC3yooyNXK5m4Fo334DdJEfp1lltfqPEg+4wuANeA0kAND2dmr7U+0KeJU6R1B2L5clVJtKO5JpgcJGlIjaIfldqCypnVx2esSyGgZBDO0SgNzYH+POpoG4dunjNyzhv34Q3hmc0rbf/HyFXzHECnP8kOAm+GNEEaGQtGBHHIrJYPue2ULUqsLyhnrzxbWglludeiMPJGZ0Mv97emCJ84Jdk2Beln5hR42if6Y36PNR52zeCzyvQI3Osh6vM/BT6S4QYHR8iv+o7E1h7grfidp43HmXs3L+uh5uVxuUBXDuEjeuV4r+QE3tzupxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abjGfPqx8oEOSIfyEQCbhhui2HFs6zqba+YSmadz20s=;
 b=lSiymfKegKw/HN0kGtZgIiXW/22cSiBSEHu4ASl/7nxTK71Ngp0bg1v/OvWx8z79L+o4fHvVPQt/l82eKD4EiBJTT8QPuf7iNjvo9kWzEyjX1TP5ffiMHohf698Gplns0FSswSUDu8r9tkWKPbhYJY+wwBRFyVABrSUsQ7OSB7nLxDPEq486paABYrlna5HAi7BgO7iO+u+MR2EyijOBkjv0xyPGmIy7LIIJoyLJJQZgZ9xpIVKyh+sp1nWGc3OS/bf6Nilp5QU5VW4Klw1G8BhNOKyIoHp+lk3U50fIvb6kw6mbDmxSdBH+fIYjK3KZFbrkkbS454uqsksrsjI3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abjGfPqx8oEOSIfyEQCbhhui2HFs6zqba+YSmadz20s=;
 b=dGfWP/SAFHLSPdALiJrm0ldG0QpjF8V9axVcXB4shWp8DUEfFn/l8Ou4b6WnLdmw9FnV4XEOnxWMpiNHJGRLhOwmbCGp7hCU+aViK6QXZkQTgsVF182ygsc3VxUKqff4gGMXiiB569rRLD4T8cZOwYjTZ8/cpLqutBZG5IIrMuTxabCTlYBJkBcHawkZtF5URGapyqIm0dHVnTIRnahikVXLBeyx37IEKrCDSq1TueExpkdXp1nbfJST87+1QJQhxA6tX2prEgqhIljRs0R4qMu8UKjwEtOCtj9P33P8ZF1kfUx1IqRekJIlq/Kx99vW9H7y7CbrKQxFg7QNmeyyZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DUYPR04MB12692.eurprd04.prod.outlook.com (2603:10a6:10:65d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Wed, 21 Oct
 2026 15:13:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 15:13:26 +0000
Date: Wed, 21 Oct 2026 10:13:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Michal Simek <michal.simek@amd.com>
Cc: "Patil, Shubham Sanjay" <shubpati@amd.com>,
	Rob Herring <robh@kernel.org>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <atjWjd2sRy1P5HmR@SMW015318>
References: <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud>
 <arL_Zgi1r1IFpNIO@SMW015318>
 <20260923-overturn-acts-5abc2e4fe6ed@spud>
 <arPlFMhcL7Jxh4wP@SMW015318>
 <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
 <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com>
Content-Disposition: inline
In-Reply-To: <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com>
X-ClientProxiedBy: PH8PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:510:23c::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DUYPR04MB12692:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d019fc-a252-419d-c414-08df2f85db1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|56012099006|11063799006|4143699003|261009223027099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: gKgE6f6kNNDKHe2iOGUGArBebY8xSQyvF+p7iWDqPnwV4yryUEtDMIY3NJeY1nG29i9KXcAJu4etACUd2EieevKy2/9oJc231vPb7zPNYiFm6RCT2darhcdTxj+p7Dks3wtFMu1pQHtf8JkQE0lCsznj6kLinoXOfz52JDiEfge0KGEvAt0kj+X7gNKs294HcgQPJLUdQ0B+3gl9dnRKzqhdnUKbBL7ZFSrHGFuJw3xgTmXbrZvX28qBdinmi9lhQP+9NViAuQcq9NCCViNHg1jg9AvxkQ5jP6NBMFlDk2FqdWY9XFoOB6mzeyUv+IDz29Hy5qHRQgvir85xX1uYFaWZHlpQDlw0i4nI01CR/4ipkzCe8c6wI8aMqQGNgD4q7tw1uhdeqxCX+k8WC1YFP6wtKo4Xh0x927bZBMZ8pAFRsSJTS3Rs9Tr3PnTZER6rTDUAgmnytEjeGMcV7bW+P6uJxwz3BnAtXNtkS06qXTPaKqQ1stZr/1413sGQdI1W3Bt0vpUI5xmECsNLznFbvGWdrq1SZAB+lnamU8JX57vP9x8APaRR00058TkOSIXxhi47OlfLgZVFepTLiXwvxrI+3tpQeApp4enqjgQI3i4NKCCHqG8VX/Pv9tg27kESnrSO4vdbhrhoh6UsiWCx0Dn4YQYSA4ZWDpTow7gZ0YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CujNQmPSzqk1P5SIPSbR9aZdGU7+NmX4X+jGKRPvzboijRHnp4RiLuyj6f?=
 =?iso-8859-1?Q?Mc0+0PuCA9hMCkyvVZ+U3XubeJalK4RgkfqqdadOXMANFMGybMUgddCJmk?=
 =?iso-8859-1?Q?BL1IaUi4Wq2TmExRBhab9eIFiXGrUFwWh3OUsJrca5cKEYxtDv29QnrCX6?=
 =?iso-8859-1?Q?6RbueXY/mUy8Xuv/dt8WlkAPgDY1kUrtNNiLkXdooXAbYZdqTcnH/HHIf1?=
 =?iso-8859-1?Q?2+ywZxd/nHlSRohR0PbVW0rTFdF1j5gR7DzaJJ4IOkpZxUo94l0OwuQIu2?=
 =?iso-8859-1?Q?K44+ihOGoaHJvU8Hk2KJPcn/yKfM/qneJ0F/0Quq7R+9VE40gSq0GGZ8fi?=
 =?iso-8859-1?Q?QPGd36ITsjPKeWV5YGDoU0cbA5eY8d3M2rNlU6izkLEYFgbTRdsnBgLVwr?=
 =?iso-8859-1?Q?cZiO4/tvHSLj9i/17Cx0i3RJtFuws3RX8VcijLEnmEHXbCPERTqXJqVymp?=
 =?iso-8859-1?Q?mfvu/QvKhhh7m7ryZGKynRcKzvL2RcFr46sK5H4cPXFbj8hPLIshmN8EeN?=
 =?iso-8859-1?Q?Sa7afQr/VHW0ID3RqORc/pgueMvrx8MN5ECNKJbcKBYCi9VqSc8mt9Wy5l?=
 =?iso-8859-1?Q?zPM1ouKzrW522aMLvAETPtPZq+5CPXRlkeC5Yk3cy6XNXYChRvaI+lbm3O?=
 =?iso-8859-1?Q?/uQvU/9wUhkWFgVFoXdXgneYM9JO2/AL7E1Rj2yqMnUa6G1/n5xFw8lLIC?=
 =?iso-8859-1?Q?AqdYNEesuD4MDAN/4IY9IqHXi/LnDuW9st4oag70BNwLJx56uJBpbQB5AK?=
 =?iso-8859-1?Q?cv2INbwFoJV/ITysUWY+kvpDXLtDct2/zpLQ86N2xqdgcqYFcDQljw8A0W?=
 =?iso-8859-1?Q?jfj7DHihrjancN/kEmCe58fBXmJBgyg0JaXgxBbPmYsNw6lhh8c5YHboCA?=
 =?iso-8859-1?Q?n0iEK2J/Z4IibsX7b9x/y4scrNOr0BjKlJtEwr8FRfYPyWLejIAMVKwkNL?=
 =?iso-8859-1?Q?N2iOgvzC8mjfaQWk5NHLSZpHSdAPOuGPMgrOapF765YfEEf4j1tCuzhBut?=
 =?iso-8859-1?Q?D7ucKtMAeU9nDJE/ZQtg546lUvtpuGHHj+HRfTbzIEahaKm4vR8jS99RkQ?=
 =?iso-8859-1?Q?J6rsz3SrYfNfm1+6nKYCPTvA8/IFGPnIPKI07jTKejXBk+p/E7FoUPFH8v?=
 =?iso-8859-1?Q?uD9Wp0m9oGV/SdxW00vSJIPZs3HmD2Yt1yUzU94nvORAb1UUOzwp+b1al8?=
 =?iso-8859-1?Q?tFESXp1w4XyknoI10yipECa57Z2lcMdLQto8bg6RrA6J7nqEm0utNYf1a5?=
 =?iso-8859-1?Q?Kv08/zch77UK024u12h/c8DozzhHgkNqiHAS/PfVijgsld4LQ/OQdgUEqW?=
 =?iso-8859-1?Q?KuzdE01v9zPA+6QtmJSlZPbw8xCgnD66qs+KoNCNMSxYZ+iCLUtuWuCOWd?=
 =?iso-8859-1?Q?HnoAN6FwMP1KhVRD7aNuFvL0SIjTViPP8XpGqRWGKsEvqL+1PSv0XdBsn7?=
 =?iso-8859-1?Q?pS8/68+THROJxEa1aZb3Mx9xt2zjSyWMshlLbLuJ+kBcB16RMWUmNRNU9k?=
 =?iso-8859-1?Q?6Kaq60p5rxtxsFt1wKGcQoPuFkhTVuDV6x3buObHL3Z1C3KuUwkTjw+2Pv?=
 =?iso-8859-1?Q?hCMVyOtAzZsB0hOMHoS96VUSsGCFVbUTk87CcECWN/xSXaYq4bg4J8NRZ1?=
 =?iso-8859-1?Q?Yo/uTw2fQwMMw2R5S8iBxrvilAnX32RGle4EElYH9ZqQLrHBnqWXF6+qK3?=
 =?iso-8859-1?Q?YUXnx74uS1q0V5fhK2o/j8m20A6HZh5jwtgXQ64KsOWvcjcrHSE5YhU8+a?=
 =?iso-8859-1?Q?uKeXFG1MCH/lq9BbB21ne35B6cMOTfF3KdWs0bcfm8073693oyZzzseHaB?=
 =?iso-8859-1?Q?X/YuSGEOftaLtSgomk3X/v8AtHRE43qiKjpSaACbLs8H86E/GL1H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d019fc-a252-419d-c414-08df2f85db1e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:13:26.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTzV1qXyUJlRmdDk62uJWMC2iW0hD9E9mQMsp1zyK6DnGFj6B3JyLERszjDokdKLtD83TuSEdfAsBDC7VYR6ZjErF6B1eBa4u75yJcdkUexNPoVlRFXoC3egXWZsFy9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081331_594896_72ABF09D 
X-CRM114-Status: GOOD (  32.27  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:06:50AM +0200, Michal Simek wrote:
> Hi Rob,
>
> On 10/7/26 08:03, Patil, Shubham Sanjay wrote:
> > Hi Rob, Just a reminder !
>
> <snip>
>
> > > > > > > No reason to keep hj because the difference between HJ and IB=
I is the
> > > > > > > address when address arbitration. If hardware support IBI, it=
 should support
> > > > > > > HJ. HJ just use special address 0x2.
> > > > > >
> > > > > > For this IP, they appear to be controlled by different configur=
ation time
> > > > > > parameters, so I don't think conflating the two is the right th=
ing to do
> > > > > > here:
> > > > > > https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
> > > > > > Per this doc, and the original commit, hotjoin configuration is=
 not
> > > > > > permitted when ibi is not supported but can be enabled and disa=
bled
> > > > > > separately when it is.
> > > > >
> > > > > I am not sure why provide such flexiblity, only difference is tha=
t compare
> > > > > address 2 or other value.
> > > >
> > > > It's not unusual for FPGA IPs to provide extreme flexibility so tha=
t the
> > > > consumption of resources can be kept to a minimum, often to the poi=
nt of
> > > > excessiveness. E.g. for a ethernet MAC IP each individual statistic=
 might
> > > > have a configuration option.
> > > >
> > > > >
> > > > > This feature may be quite common for i3c, if other soft IP provid=
er such
> > > > > flexiblity, still common property is the better than vendor speci=
fic one.
> > > >
> > > > I'm not at all in favour of speculatively adding properties for
> > > > configuration properties of FPGA IPs, particularly given the likeli=
hood
> > > > of abuse by others. Without multiple demonstrated users, things sho=
uldn't
> > > > be considered for being made common anyway.
> > >
> > > Rob:
> > > =A0=A0=A0=A0=A0=A0=A0=A0 What's your opinion? I predict we will met s=
imilar problem when
> > > I3C become popluar.
> > > =A0=A0=A0=A0=A0=A0=A0=A0 Do you perfer use vendor property fistly or =
direct add common
> > > property?
> > > =A0=A0=A0=A0=A0=A0=A0=A0 There will be back compatible problem if cha=
nge vendor property to
> > > common property.
> > >
> > > Frank
>
> It looks like this thread is stuck and everybody is waiting for your opin=
ion
> about it. Can you please take a look when you have time?

I suggest make a version, which support all enable/disable IBI/HJ. We can
discuss later. I think less possible to config two difference instance at
one SoC.

Frank

>
> Thanks,
> Michal
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
