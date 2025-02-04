Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD684C0219D
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/laLoOckZHZhzX8HDiGgxyXzk48yXEb66zdckE0hpWg=; b=K8GGf4U4Hg9AOT
	ulh3nLdQhiwIRrlfGknO89GJrGYWKxh65WGwADsfxsv6WlBur9KcHJekU+PNfVgQ4tRh2qfxPcQFW
	Xr9XI3ab6iFWt2AdQhEPtqnpROvMHiLVOFoeKhHlwRo7XUOUHdp4tDdN3DOeN3joXs6KYEUZsF8IN
	EShKDNZGet0lWuummkXjuV/w0ljO7vD60iHMl+JSbCvqz7Rd+Mb94io02qsh6Um8jnN8T0nhXlsgY
	nrGZAFfTomwn6WZbrgZUh+iF4K/PR5+EI/X6FoThTki77ZRMRJLt3cMqIfUUMUtr3b7Wdq2aoPJBp
	A9tNv8bl15q2GeNKg3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCG-00000000sXb-0dgf;
	Tue, 04 Feb 2025 15:50:44 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfL57-00000000rYv-40i7
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 15:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fULvbMKjwIfYjqel3kqtCx372BJFUGzMlhIBppx28DtaTGRSbU6mFUcWn/HO7HdTt2ynZgi22Dmw8DPMmKcCBCj2q40wBz97fCb5LaRCDE/4hk0wvfQisWOS5WlYzhjDJMtXT8RsLb3PBH5PAB3zpPbSulX1a8pJ3aIUMLz3SJ3JEFKXzgnDMrnbmBgfxnFBoc0T30kqzkVK48ihjJ0urmTfTM1k2YEMWNo/bEldb48d2TokBeaameYaSvq6dZfVsfYuM/dBkfGte9wb0Pl7nCmAKNSxfsBZkoi61QblKF8W1nsBu75k0USo2yU24ah75R2e2RgzGHhHiSEpGcxDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zqRLkClDekaP3B71b1SU2TD9pGrrmBFQ77ZjcQC8Ho=;
 b=SiOp3MTx+XhZ5O4SiidqVNnac6k+6DCkP+viBz0Bo4Hgah5f4DRuN2ZAA3Nigvl0I2ijSftXxdY2hrTHAg1exhyYc2oAHSEsvUNUNq5CquLUGSzeZAW/YXp8syV6WYw/+I8d5moROYSVYC+yZKFD+KASzuU7UGSwlpaljwn+H2rd/1f75EDWgfsoZbZJRcj0MWoDqGmvHSyWXqtzS+1qE6TfKoo5e1aNu28c3EOMHhuGr85ZNNvznwUV0h7np520BNHyhmXXh0zu9s3ATCPVYPZKp3X0gWup66QlE191z8Mo5m6QGDfncUUbADJbJw/4D1xS0FlUP4D3qvSho3t5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zqRLkClDekaP3B71b1SU2TD9pGrrmBFQ77ZjcQC8Ho=;
 b=hgC+iasZwEHwdBfK8Qq4rpPFVMIjwet2u57C6pqwSHrGY76MSHK/QQW0DGo5twVFbND3XZZy/cyye8gHIGPoqET8Sh/h4eyhpoPfrR0H3YcDAAweFknF9iBAxVQiQmY8NRFB1qy0YCgqFoJDDQQ3lU21lN16wEaKWEmgcQdYX+EKg4el8sZIH0FdsZ6/gmMHv9mHQMtlTxEVJ7LSNo50+Ju9tYEJjiCED2JQMzP6SIKXa6Nf51/QFmzLVcL3WdN3v7JYrRq9rJ9g4vOX/8xoMWSp7hFPEfVUp1IoiMel8CFz8TjD0FBNWTnuElsq5CRcjihv6z7l238S0g8LsDx2CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 15:43:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:43:16 +0000
Date: Tue, 4 Feb 2025 10:43:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6I1jBx273o5GE5w@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <08098961-ab40-4bdf-af56-c77a24c55959@quicinc.com>
Content-Disposition: inline
In-Reply-To: <08098961-ab40-4bdf-af56-c77a24c55959@quicinc.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 97df70b0-d9d5-4e3e-06fc-08dd4532a3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fikD0QNuTFDtKIktvzbNNheqeoUYPxlJAUAvkU7kSK471OOEqzWf2QNd3x?=
 =?iso-8859-1?Q?Xysu4L6XDdSNc4olpfqTKf/k6U+nXdP1sE3yg0UOY7IIm/dT8evPCj9rl4?=
 =?iso-8859-1?Q?YEMEIdNelXOrD9/eD0P80d5jLDrFmjufWsciDfC8rL+3iWD1FAwVqUSfqP?=
 =?iso-8859-1?Q?fDKdEH/Wtd5+9aKyc+Y2DnsIg6qO1Q8507zPG13aXVjMoxxWFlR/YVj6/7?=
 =?iso-8859-1?Q?8dnlBI0YyRos0nvD4nQUCmgfrNxNbkqqiAZrj983aqpOxK/GhYmsNmMZCS?=
 =?iso-8859-1?Q?nNm0gApEbD+azukbStSvInGtRfStGOphloUcY7UbQz3c+iFGqTltVKEqGe?=
 =?iso-8859-1?Q?dBnTDoUY1cBTT5wxaJ6o9ZbD3xTPmpZmLP7vEQkjgp9YdUHppILMjTcjQB?=
 =?iso-8859-1?Q?F7iy6B3dbdz9Ul2MCGtozNEce9kAVde32nnLqL1NEfAl7nlXM7dWCZKrWk?=
 =?iso-8859-1?Q?uyhf3hsVUG10/7sJTkaihFSdPRgCjAFHbE2toTsilwzbsLuYNR5k5zc4Fy?=
 =?iso-8859-1?Q?e9zAltHQqIKXXQHzG2dLQLkIht6W0LDAX8WJOt7iPaO1CdWv9sO+MThiDX?=
 =?iso-8859-1?Q?UobF/L+TxEmNoVNeimaZYlzHZvvN4cJxcZjE2K9vWJzy3ZYseWWtBfTfBL?=
 =?iso-8859-1?Q?hL/JBwNaALSnW6wTtPONf81115ReZeFOaTvHL/jBlnfG4AOF6crNaCBD9j?=
 =?iso-8859-1?Q?ybGW+c3DJXdPLDgXnKmVR+8iB95JNqer3LN/Cwm/ZTtFLqXryp5gbOrI0y?=
 =?iso-8859-1?Q?mh+sb4JaTh2hsj+dEvjmtj9Va0c1N+tLvU5SYSeu0lM/Rm05UwZc4XV/GQ?=
 =?iso-8859-1?Q?eRekzYPppR/ewCm6oJuIusLCvLgu7KzD7vYzJ5QrbZ/B3NXG3pVFAQGsc/?=
 =?iso-8859-1?Q?EdVj8z1k0G68khyLci+3ndJMAzLo4QPSb53fiBtymL8bK+P91MRgxe7U/b?=
 =?iso-8859-1?Q?BLQiAg9BEpE78laNDxZe9zdudPOwGW+i6rnidufItOkTfSui6BOK3hbuX1?=
 =?iso-8859-1?Q?BB4gRcImbZWqDYoLWPaFtF9hrDaytFbG6yZrfztBsa+dqfEJtKi9fKZgKn?=
 =?iso-8859-1?Q?Hi2keWvZPysPgjzOOXmciTsY2g7Z85nRTanXk+C6L2dk3gAq+ObMylrdpq?=
 =?iso-8859-1?Q?V9j3oJ2+T1IZwrxiMV20NXMsLr09Nnj/53X0WCSp3FDqtnFhd+uL94EeIt?=
 =?iso-8859-1?Q?hsZOO6Tihj4pAt4my/NcDafzGBnvlyKN2KxyHw8IZEZmYmjieuLgwYHbhj?=
 =?iso-8859-1?Q?8fmYeEC2JB08a0jR4cSkldRYt4F/K7kKkMHRvLQQ78/kdHqBJXlcWWZYLy?=
 =?iso-8859-1?Q?gd6/wIpCzPmgcCqzGwtaz3+0kgHFOBxonkVs6hwK76vTFqQHbt6p1DzYUe?=
 =?iso-8859-1?Q?WIaUu0FbmpaIXm+YK3JuKlzxCuVdBh6c0ciiHUEJ9566g2+yjxv6fijis8?=
 =?iso-8859-1?Q?vT0vNShRfdVXL+XLk9DscNNmrb5EFvRHMeOwbXimtErtcKs1iouzT/D3Jf?=
 =?iso-8859-1?Q?al+7lpZOVLSUObZdz2dy15?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DdV3s8wZUytyedpDV4FgBLFL3i/Pq1+PDsrKRyvFH30XNIGKjFflCdFNeZ?=
 =?iso-8859-1?Q?LhfQgBzgXZizu+tAYd8L3PNyPI/GM0ZAsR/slFiUuJIlZ2clTNxL6UaXS4?=
 =?iso-8859-1?Q?iA2bJQKTLmAGQ+bUniLP+yMQBPp3deBnokL47E/ZUNw1UVviv0lRNwO6OC?=
 =?iso-8859-1?Q?ZKNWdtzcDekVktZnds4/MCd76kJALuetI20Q2bWQxH2PFbAjYbe43cLzNn?=
 =?iso-8859-1?Q?B3kCKZMOng9gJkKy1X74F3OKv6SdjLnh1JxR3Bx3ympOBgZvFhKs5mEF8U?=
 =?iso-8859-1?Q?ygPYYAjMbT56NjKXZdTjEbRoXWCuo3VMXfc5vqFxYa7p0mMfUbEp3Xd92g?=
 =?iso-8859-1?Q?az8ZzjvSW9WLhtW2jmXFfcPB+tj88+OWIanQMlZyy+09DVStHoHF3WH/Re?=
 =?iso-8859-1?Q?vENEUKScPk23DkGt5zVVH+lfak+KkuiY38USOBZecX/Gdv2Z0I7laBAIny?=
 =?iso-8859-1?Q?Ip2kX4nelgjWspDIkuft3m8nw194DQ5TYvOiwv4c9/cGY9WFshr5QtniIs?=
 =?iso-8859-1?Q?qN+xu3GgWoyQvrrh6cQfiCvu/j28bSDODEZDZv74IU8vYf9IUArtX/YFKZ?=
 =?iso-8859-1?Q?kQvvRxjClFQdcSN37XRQ2X1/MYKYsfhK2Wh6f6FWFUIuZ1sSVJfsT6a1n8?=
 =?iso-8859-1?Q?wqEnD3MQmiGPn42fYfWaznBFqWE45U2hcPxToVmmJyMRI2ukeKPldg79su?=
 =?iso-8859-1?Q?xZDrzkuKkCa07ui1hMqX+w6nXisRu9t9UQ58ssynBpB9Y3G4wKPiyRCZmE?=
 =?iso-8859-1?Q?hM/pZX8yIQABt9emg5ZfRRcYMcYRa8gc6SN1b43ccYzGdWjyVNrXtuMcBf?=
 =?iso-8859-1?Q?RVEw+X7blRTb6Yc7y9dLp1Nqy2l8xryzekp3/9NU3nTnJ9noX/vQh6ZTt8?=
 =?iso-8859-1?Q?ENJMLBf8UG7m2uiheDbUzppm5PafjV46Xo+LedMPWMUvpQr1PBnqMhxY1j?=
 =?iso-8859-1?Q?gNRx10/c3xxNijxy0wTvBjZk2rywBCI63zSEyoNIXS5+QGJeNBbq9jwFiq?=
 =?iso-8859-1?Q?7+6qIsmLIoOc7EOJwwHmTsZQBop2hG+yknV+JC1S86JLCZWi8a3MREbkPZ?=
 =?iso-8859-1?Q?ej6BH+Kbw5H0oMF+TLJVr35eYg1Xrgwy/Wim0/7s2ERYn6ebXeshdPZWBg?=
 =?iso-8859-1?Q?jM6tUEhsmJY/KFf75xmx9gVAMMjMyRZ9yylzNiRmSMz8lNPgwPfkgRHJAB?=
 =?iso-8859-1?Q?z19scrE8XcvJP3DQv3j03Z5WJ+qVHJrw3CluaksM2dAwnA2+Y1iAnFxxCp?=
 =?iso-8859-1?Q?yfS9edfkMGZH22M4xL+j423amXD6hUOBjzq9UfinboA95HAAd1KouPh50i?=
 =?iso-8859-1?Q?iKCdv0vXgg50ZB6PnlDbY+nCq6wBTz7v+AUPY4K6xKKbpIeDUOFS5MzKDl?=
 =?iso-8859-1?Q?1ZKFkvPCM/nsKK3mVQ2kjt3Pv4OP7gxI7A6e2I3VBplHDF3VLg7Tp5nEv0?=
 =?iso-8859-1?Q?H82UxPm3bfPmPSp6mTrEsRVgdB9pqJiK8gSlfC6iAol8zipjPzxzYZwpTx?=
 =?iso-8859-1?Q?jdHUKKesVE6sGqvX+PLpNN3cATpe/XWVUhKswkYvDTLzlyzCTIjIWWO4lK?=
 =?iso-8859-1?Q?87dEwQ0MD6p4aMapbOzChf+JEC8YGLWSTPCBMFgP2LavuS6SbCih9dXOmp?=
 =?iso-8859-1?Q?6OzFs8wDg9zEk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97df70b0-d9d5-4e3e-06fc-08dd4532a3f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:43:16.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7KEKSSPi3nd6mdWYi/Uy6MUhZLaLo5wGOVp3POEXyPRS4z+UsNIbgaBwZm7ubV0GTGoAu4dXvNN5tDhSf14cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_074322_150718_74D2EEE0 
X-CRM114-Status: GOOD (  42.29  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Feb 04, 2025 at 11:24:03AM +0530, Mukesh Kumar Savaliya wrote:
>
>
> On 2/3/2025 9:22 PM, Frank Li wrote:
> > On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> > > Hi Mukesh and Frank,
> > >
> > > On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> > > > Hi Frank,
> > > >
> > > > On 1/30/2025 1:35 AM, Frank Li wrote:
> > > > > I3C HDR requires enter/exit patterns during each I3C transfer. Ad=
d a new
> > > > > API i3c_device_do_priv_xfers_mode(). The existing
> > > > > i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mod=
e(I3C_SDR)
> > > > > to maintain backward compatibility.
> > > > >
> > > > > Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anony=
mous union
> > > > > with 'rnw' since HDR mode relies on read/write commands instead o=
f the
> > > > > 'rnw' bit in the address as in SDR mode.
> > > > >
> > > > > Add a priv_xfers_mode callback for I3C master drivers. If priv_xf=
ers_mode
> > > > > is not implemented, fallback to SDR mode using the existing priv_=
xfers
> > > > > callback.
> > > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > Why not add hdr mode in struct i3c_priv_xfer because mode can't b=
e mixed in
> > > > > one i3c transfer. for example, can't send a HDR follow one SDR be=
tween
> > > > > START and STOP.
> > > > >
> > > > Is it wise to add two function inside main funcion and separate SDR=
 vs HDR ? so we don't need to change current function arguments.
> >
> > I am not sure if understand your means. HDR have difference mode, anyway
> > need add new argument.
> >
> let me clarify, We can have main entry/hookup function as it is.
> From priv_xfer , we can call sdr_priv_xfer and hdr_priv_xfer ? based on t=
he
> structure information if its enum SDR or enum HDR.
>
> > >
> > > I think the 'private transfers' are limited to SDR communications,
> > > would it be better if we have a different interface/naming for hdr tr=
ansfers?
> >
> > The key is what's difference between hdr and private transfers. So far =
only
> > command vs rnw, any other differences I missed?
> >
> yes, but can we make it priv_xfer() =3D sdr_priv_xfer() + hdr_priv_xfer()=
 ?

struct i3c_priv_xfer is array, each i3c_priv_xfer item is indepent. Can you
write a simple code to demostrate your idea.

Frank

> > >
> > > > > i3c_priv_xfer should be treat as whole i3c transactions. If user =
want send
> > > > > HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() tw=
ice,
> > > > > instead put into a big i3c_priv_xfer[n].
> > > > > ---
> > > > >  =A0 drivers/i3c/device.c=A0=A0=A0=A0=A0=A0 | 19 +++++++++++++---=
---
> > > > >  =A0 drivers/i3c/internals.h=A0=A0=A0 |=A0 2 +-
> > > > >  =A0 drivers/i3c/master.c=A0=A0=A0=A0=A0=A0 |=A0 8 +++++++-
> > > > >  =A0 include/linux/i3c/device.h | 12 +++++++++++-
> > > > >  =A0 include/linux/i3c/master.h |=A0 3 +++
> > > > >  =A0 5 files changed, 35 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > index e80e487569146..e3db3a6a9e4f6 100644
> > > > > --- a/drivers/i3c/device.c
> > > > > +++ b/drivers/i3c/device.c
> > > > > @@ -15,12 +15,13 @@
> > > > >  =A0 #include "internals.h"
> > > > >  =A0 =A0 /**
> > > > > - * i3c_device_do_priv_xfers() - do I3C SDR private transfers dir=
ected to a
> > > > > - *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 specific device
> > > > > + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfer=
s directed to a
> > > > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
pecific device
> > > > >  =A0=A0 *
> > > > >  =A0=A0 * @dev: device with which the transfers should be done
> > > > >  =A0=A0 * @xfers: array of transfers
> > > > >  =A0=A0 * @nxfers: number of transfers
> > > > > + * @mode: transfer mode
> > > > >  =A0=A0 *
> > > > >  =A0=A0 * Initiate one or several private SDR transfers with @dev.
> > > > >  =A0=A0 *
> > > > > @@ -32,9 +33,9 @@
> > > > >  =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 driver needs to resend=
 the 'xfers' some time later.
> > > > >  =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 See I3C spec ver 1.1.1=
 09-Jun-2021. Section: 5.1.2.2.3.
> > > > >  =A0=A0 */
> > > > > -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv=
_xfer *xfers,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> > > > > +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_p=
riv_xfer *xfers,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, =
enum i3c_hdr_mode mode)
> > > > why can't we pass mode as another structure member inside struct i3=
c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
> >
> > If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actuall=
y,
> > I3C can't do that.  we assume finish whole xfers between one whole trac=
tion
> > (between START and STOP).
> >
> > Frank
> > > > >  =A0 {
> > > > >  =A0=A0=A0=A0=A0 int ret, i;
> > > > >  =A0 @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_=
device *dev,
> > > > >  =A0=A0=A0=A0=A0 }
> > > > >  =A0 =A0=A0=A0=A0=A0 i3c_bus_normaluse_lock(dev->bus);
> > > > > -=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers,=
 nxfers);
> > > > > +=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers,=
 nxfers, mode);
> > > > >  =A0=A0=A0=A0=A0 i3c_bus_normaluse_unlock(dev->bus);
> > > > >  =A0 =A0=A0=A0=A0=A0 return ret;
> > > > >  =A0 }
> > > > > +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> > > > > +
> > > > > +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_=
priv_xfer *xfers, int nxfers)
> > > > > +{
> > > > > +=A0=A0=A0 return i3c_device_do_priv_xfers_mode(dev, xfers, nxfer=
s, I3C_SDR);
> > > > > +}
> > > > >  =A0 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> > > > >  =A0 =A0 /**
> > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > index 433f6088b7cec..553edc9846ac0 100644
> > > > > --- a/drivers/i3c/internals.h
> > > > > +++ b/drivers/i3c/internals.h
> > > > > @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *b=
us);
> > > > >  =A0 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> > > > >  =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enu=
m i3c_hdr_mode mode);
> > > > >  =A0 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> > > > >  =A0 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> > > > >  =A0 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > index d5dc4180afbcf..67aaba0a38db2 100644
> > > > > --- a/drivers/i3c/master.c
> > > > > +++ b/drivers/i3c/master.c
> > > > > @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_d=
esc *dev)
> > > > >  =A0 =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *de=
v,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enu=
m i3c_hdr_mode mode)
> > > > >  =A0 {
> > > > >  =A0=A0=A0=A0=A0 struct i3c_master_controller *master;
> > > > >  =A0 @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(stru=
ct i3c_dev_desc *dev,
> > > > >  =A0=A0=A0=A0=A0 if (!master || !xfers)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > >  =A0 +=A0=A0=A0 if (master->ops->priv_xfers_mode)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return master->ops->priv_xfers_mode(dev, x=
fers, nxfers, mode);
> > > > > +
> > > > >  =A0=A0=A0=A0=A0 if (!master->ops->priv_xfers)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOTSUPP;
> > > > >  =A0 +=A0=A0=A0 if (mode !=3D I3C_SDR)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > +
> > > > >  =A0=A0=A0=A0=A0 return master->ops->priv_xfers(dev, xfers, nxfer=
s);
> > > > >  =A0 }
> > > > >  =A0 diff --git a/include/linux/i3c/device.h b/include/linux/i3c/=
device.h
> > > > > index b674f64d0822e..7ce70d0967e27 100644
> > > > > --- a/include/linux/i3c/device.h
> > > > > +++ b/include/linux/i3c/device.h
> > > > > @@ -40,11 +40,13 @@ enum i3c_error_code {
> > > > >  =A0 =A0 /**
> > > > >  =A0=A0 * enum i3c_hdr_mode - HDR mode ids
> > > > > + * @I3C_SDR: SDR mode (NOT HDR mode)
> > > > >  =A0=A0 * @I3C_HDR_DDR: DDR mode
> > > > >  =A0=A0 * @I3C_HDR_TSP: TSP mode
> > > > >  =A0=A0 * @I3C_HDR_TSL: TSL mode
> > > > >  =A0=A0 */
> > > > >  =A0 enum i3c_hdr_mode {
> > > > > +=A0=A0=A0 I3C_SDR,
> > > > >  =A0=A0=A0=A0=A0 I3C_HDR_DDR,
> > > > >  =A0=A0=A0=A0=A0 I3C_HDR_TSP,
> > > > >  =A0=A0=A0=A0=A0 I3C_HDR_TSL,
> > > > > @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> > > > >  =A0 /**
> > > > >  =A0=A0 * struct i3c_priv_xfer - I3C SDR private transfer
> > > > >  =A0=A0 * @rnw: encodes the transfer direction. true for a read, =
false for a write
> > > > > + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, writ=
e: 0x00 - 0x7f
> > > > >  =A0=A0 * @len: transfer length in bytes of the transfer
> > > > >  =A0=A0 * @actual_len: actual length in bytes are transferred by =
the controller
> > > > >  =A0=A0 * @data: input/output buffer
> > > > > @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> > > > >  =A0=A0 * @err: I3C error code
> > > > >  =A0=A0 */
> > > > >  =A0 struct i3c_priv_xfer {
> > > > > -=A0=A0=A0 u8 rnw;
> > > > > +=A0=A0=A0 union {
> > > > > +=A0=A0=A0=A0=A0=A0=A0 u8 rnw;
> > > > > +=A0=A0=A0=A0=A0=A0=A0 u8 cmd;
> > > > > +=A0=A0=A0 };
> > > > >  =A0=A0=A0=A0=A0 u16 len;
> > > > >  =A0=A0=A0=A0=A0 u16 actual_len;
> > > > >  =A0=A0=A0=A0=A0 union {
> > > > > @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_devi=
ce *dev,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfer=
s);
> > > > >  =A0 +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_p=
riv_xfer *xfers,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, =
enum i3c_hdr_mode mode);
> > > > > +
> > > > >  =A0 int i3c_device_do_setdasa(struct i3c_device *dev);
> > > > >  =A0 =A0 void i3c_device_get_info(const struct i3c_device *dev, s=
truct i3c_device_info *info);
> > > > > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/maste=
r.h
> > > > > index 12d532b012c5a..352bd41139569 100644
> > > > > --- a/include/linux/i3c/master.h
> > > > > +++ b/include/linux/i3c/master.h
> > > > > @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> > > > >  =A0=A0=A0=A0=A0 int (*priv_xfers)(struct i3c_dev_desc *dev,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv_xf=
er *xfers,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> > > > > +=A0=A0=A0 int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfer=
s, enum i3c_hdr_mode mode);
> > > > >  =A0=A0=A0=A0=A0 int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> > > > >  =A0=A0=A0=A0=A0 void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> > > > >  =A0=A0=A0=A0=A0 int (*i2c_xfers)(struct i2c_dev_desc *dev,
> > > > >
> > > >
> > > >
> > >
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
